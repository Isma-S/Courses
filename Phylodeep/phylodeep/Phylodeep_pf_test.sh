# Run Phylodeep with Command-line 

# a priori model adequacy check: highly recommended
checkdeep -t /home/cjo63/Phyloformer/Reconstructed_trees/tree_1_sequences.pf.nwk -m BD -o BD_model_adequacy.png

# parameter inference
paramdeep -t /home/cjo63/Phyloformer/Reconstructed_trees/tree_1_sequences.pf.nwk -p 1.00 -m BD -v FFNN_SUMSTATS -o /home/cjo63/phylodeep/phylodeep/Phylodeep_output_files/Phylodeep_pf_BD_FFNN.csv
paramdeep -t /home/cjo63/Phyloformer/Reconstructed_trees/tree_1_sequences.pf.nwk -p 1.00 -m BD -v CNN_FULL_TREE -o /home/cjo63/phylodeep/phylodeep/Phylodeep_output_files/Phylodeep_pf_BD_CNN_CI.csv -c
