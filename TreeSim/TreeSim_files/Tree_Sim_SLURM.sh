#!/bin/bash
#SBATCH --job-name=TreeSim
#SBATCH --output=TreeSim_output_%j.txt  # Save output to file
#SBATCH --error=RJob_error_%j.txt    # Save error to file
#SBATCH --cpus-per-task=4            # Number of CPU cores per task
#SBATCH --mem=4G                     # Memory per node

# Initialize Conda environment
source /home/cjo63/miniconda3/etc/profile.d/conda.sh
conda activate r_env

# Run the R script
Rscript /home/cjo63/TreeSim_files/TreeSim.R
