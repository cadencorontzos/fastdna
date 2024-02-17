#!/bin/bash

# Specify the directory containing the files
sequences="./sequences/genome_sequence_datasets"

# Iterate through each file in the directory

for file in "$sequences"/*; do
	echo "--------------"
	grep -v '^>' $file | grep -o . | sort -u

done
