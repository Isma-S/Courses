#!/bin/bash

#SBATCH --job-name=Phyloformer_predict   # Job name
#SBATCH --nodes=1                        # Run all processes on a single node
#SBATCH --cpus-per-task=50               # Number of CPU cores per task
#SBATCH --mem=100G                       # Total memory for the job
#SBATCH --ntasks=1                       # Run a single task
#SBATCH --output=Phyloformer_predict_%j.log    # Standard output and error log (%j expands to jobId)

# Correctly initialize and activate your Conda environment
source /home/cjo63/miniconda3/etc/profile.d/conda.sh
conda activate phylo

# Run the Phyloformer predict command

predict /home/cjo63/seqgen/FASTA_files_L1.0_M0.25/test -o /home/cjo63/Phyloformer/Reconstructed_trees_L1.0_M0.25

# Deactivate Conda environment
conda deactivate
