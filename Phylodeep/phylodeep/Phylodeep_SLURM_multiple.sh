#!/bin/bash

#SBATCH --job-name=phylodeep_run
#SBATCH --cpus-per-task=29
#SBATCH --mem=100G
#SBATCH --output=phylodeep_run_%j.log

# Load Conda environment
source /home/cjo63/miniconda3/etc/profile.d/conda.sh
conda activate phyloenv

# Directory with tree files
TREE_DIR="/home/cjo63/Phyloformer/Reconstructed_trees/Over_50_tips"
OUTPUT_DIR="/home/cjo63/phylodeep/phylodeep/Phylodeep_output_files"

# Function to process a single tree
process_tree() {
    local tree_file=$1
    local base_name=$(basename "$tree_file" .pf.nwk)

    # a priori model adequacy check
    checkdeep -t "$tree_file" -m BD -o "/home/cjo63/phylodeep/phylodeep/Phylodeep_output_files/${base_name}_BD_model_adequacy.png"

    # parameter inference with different output names
    paramdeep -t "$tree_file" -p 1.00 -m BD -v FFNN_SUMSTATS -o "/home/cjo63/phylodeep/phylodeep/Phylodeep_output_files/${base_name}_BD_FFNN.csv"
    paramdeep -t "$tree_file" -p 1.00 -m BD -v CNN_FULL_TREE -o "/home/cjo63/phylodeep/phylodeep/Phylodeep_output_files/${base_name}_BD_CNN_CI.csv" -c
}


export -f process_tree

# Process each tree file in parallel
find "$TREE_DIR" -name '*.pf.nwk' -print0 | xargs -0 -n 1 -P 29 -I {} bash -c 'process_tree "$@"' _ {}

# Deactivate Conda environment
conda deactivate
