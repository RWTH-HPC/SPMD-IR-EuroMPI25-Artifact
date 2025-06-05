#!/bin/bash
ts=$(date +%s%N)
"$@"
echo "Command ($@) took time (us): $((($(date +%s%N) - $ts)/1000))"
