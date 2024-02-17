

# get counts of each character
 grep -v '^>' sequences/genome_sequence_datasets/Chondrus.fa | grep -o .| sort | uniq -c

