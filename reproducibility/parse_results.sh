#!/usr/bin/env sh

# if the first argument is not provided, print usage
if [ -z "$1" ]; then
    echo "Usage: $0 <path_to_cq_results_folder>"
    exit 1
fi

mkdir -p $1/summaries
mkdir -p $1/summaries_tex

# for loop over different folders
for folder in MBB RRB/MPIRMA RRB/SHMEM RRB/NVSHMEM-gpuInitiated RRB/NVSHMEM-hostInitiated RRB/NVSHMEM-hybridInitiated RRB/MIXED; do
    # check if the folder exists
    if [ ! -d "$1/$folder" ]; then
        echo "Folder $1/$folder does not exist."
        continue
    fi

    # check if the results.csv file exists
    if [ ! -f "$1/$folder/results.csv" ]; then
        echo "File $1/$folder/results.csv does not exist."
        continue
    fi

    python util/parse_results.py $1/$folder/results.csv --verbose > $1/summaries/$(echo $folder | sed 's/\//-/g').txt
    python util/parse_results.py $1/$folder/results.csv --verbose --latex > $1/summaries_tex/$(echo $folder | sed 's/\//-/g').txt
done