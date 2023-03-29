#!/bin/bash

# Check if the input and output file names have been specified
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 input_file output_file"
    exit 1
fi

# Set the input and output file names
input_file="$1"
output_file="$2"

# Count the number of records in the input file
num_records=$(wc -l "$input_file" | awk '{print $1}')

# Set the number of records to include
if [ "$num_records" -gt "100000" ]; then
    num_records=100000
fi

# Select the first record (the header) and num_records-1 random records from the input file
head -n 1 "$input_file" > "$output_file"
tail -n +2 "$input_file" | shuf -n "$((num_records-1))" >> "$output_file"
