#!/bin/bash

# Check if two filenames are provided as arguments
if [ $# -ne 2 ]; then
    echo "Usage: $0 <header_lines_file> <other_lines_file>"
    exit 1
fi

# Input filenames
header_lines_file="$1"
other_lines_file="$2"

# Output filename for the reconstructed FASTA file
reconstructed_fasta_file="reconstructed.fasta"

# Combine header lines and other lines to reconstruct the original FASTA file
awk 'NR==FNR{a[$1]=$0;next} {print a[FNR],$0}' "$header_lines_file" "$other_lines_file" > "$reconstructed_fasta_file"

echo "Reconstructed FASTA file saved as: $reconstructed_fasta_file"

