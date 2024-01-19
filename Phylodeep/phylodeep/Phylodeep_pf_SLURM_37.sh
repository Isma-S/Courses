#!/bin/bash

#SBATCH --job-name=phylodeep_run
#SBATCH --cpus-per-task=1
#SBATCH --mem=10G
#SBATCH --output=phylodeep_run_%j.log

# Load Conda environment
source /home/cjo63/miniconda3/etc/profile.d/conda.sh
conda activate phyloenv

# a priori model adequacy check
checkdeep -t /home/cjo63/Phyloformer/Reconstructed_trees/tree_37_sequences.pf.nwk -m BD -o /home/cjo63/phylodeep/phylodeep/Phylodeep_output_files/BD_model_adequacy.png

# parameter inference
paramdeep -t /home/cjo63/Phyloformer/Reconstructed_trees/tree_37_sequences.pf.nwk -p 1.00 -m BD -v FFNN_SUMSTATS -o /home/cjo63/phylodeep/phylodeep/Phylodeep_output_files/Phylodeep_pf_BD_FFNN.csv
paramdeep -t /home/cjo63/Phyloformer/Reconstructed_trees/tree_37_sequences.pf.nwk -p 1.00 -m BD -v CNN_FULL_TREE -o /home/cjo63/phylodeep/phylodeep/Phylodeep_output_files/Phylodeep_pf_BD_CNN_CI.csv -c

# Deactivate Conda environment
conda deactivate
