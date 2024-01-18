#!/bin/bash

# Directory containing your tree files
TREE_DIR="/home/cjo63/TreeSim_files/tree_files/tree_files_lambda_1.0_mu_0.25"

# Directory where you want to save the output sequences
OUTPUT_DIR="/home/cjo63/seqgen/Length_100_L1.0_M0.25"

# Loop through each tree file in the directory
for TREE_FILE in $TREE_DIR/*.nwk; do
    # Extract the filename without the extension for output naming
    BASE_NAME=$(basename $TREE_FILE .nwk)

    # Run Seq-Gen for each tree file
    /home/cjo63/seqgen/Seq-Gen/source/seq-gen -m PAM -l 100 < $TREE_FILE > $OUTPUT_DIR/${BASE_NAME}_sequences.almost_FASTA
done
