#!/bin/bash

# Specify the directory containing the files
sequences="./sequences/genome_sequence_datasets"

# Iterate through each file in the directory
num_files=0
num_failures=0
header="---------------------------------------------------------------------"

for file in "$sequences"/*; do
    # Check if the file is a regular file (not a directory)
    if [ -f "$file" ]; then
    	let num_files++ 
		echo $header
		echo "FILE: $file"

		# Test seperate and combine, print results
		header_lines_file="$file.metadata.sep"
		other_lines_file="$file.genetic.sep"
		./fasta-seperate.sh $file
		./fasta-combine.sh $header_lines_file $other_lines_file
		
		if diff -q $file "$header_lines_file.reconstructed.fasta" >/dev/null; then
			echo "SUCCESS"
		else
			echo "ERROR"
    		let num_failures++
		fi

		rm $file.*
    fi
done
echo $header
echo "$num_files Files tested, $num_failures failures."
