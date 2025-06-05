#!/bin/bash

input_file=$1
# Create and clean up temporary file
tmpfile=$(mktemp)
trap 'rm -f "$tmpfile"' EXIT

# Step 1: Extract first two warning file:line pairs per section
awk -v RS="--------------------------------------------------------------------------------------------------------------" '
{
    n = 0
    pair = ""
    while (match($0, /([\/A-Za-z0-9_.-]+\.cpp):([0-9]+):[0-9]+: warning:/, arr)) {
        pair = pair arr[1] ":" arr[2] "\n"
        $0 = substr($0, RSTART + RLENGTH)
        if (++n == 2) break
    }
    if (n == 2) printf "%s", pair > "/dev/stderr"
}' "$input_file" 2> "$tmpfile"

# Step 2: Collapse every pair into a single line and count occurrences
awk '
    NR % 2 == 1 { op1 = $0 }
    NR % 2 == 0 { op2 = $0; print op1 "|" op2 }
' "$tmpfile" |
    sort | uniq -c | sort -nr | while read -r count pair; do
        op1=$(echo "$pair" | cut -d"|" -f1)
        op2=$(echo "$pair" | cut -d"|" -f2)
        echo "$count occurrence(s):"
        echo "  Operation 1: $op1"
        echo "  Operation 2: $op2"
        echo
    done
