#!/bin/bash

# Check if a filename is provided as an argument
if [ $# -ne 1 ]; then
    echo "Usage: $0 <filename>"
    exit 1
fi

# Input filename
input_file="$1"

# Output filenames
header_lines_file="$1_metadata.sep"
other_lines_file="$1_genetic.sep"

# Extract lines starting with '>' into header lines file
awk '/^>/ {print NR, $0}' "$input_file" > "$header_lines_file"

# Extract other lines into other lines file
grep -v "^>" "$input_file" > "$other_lines_file"

echo "Header lines saved in: $header_lines_file"
echo "Other lines saved in: $other_lines_file"
