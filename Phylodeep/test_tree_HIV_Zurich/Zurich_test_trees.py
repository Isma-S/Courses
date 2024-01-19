from phylodeep import BD, BDEI, BDSS, FULL
from phylodeep.checkdeep import checkdeep
from phylodeep.modeldeep import modeldeep
from phylodeep.paramdeep import paramdeep


#path_to_tree = './Zurich.trees'
path_to_tree = '/home/cjo63/phylodeep/test_tree_HIV_Zurich/Zurich.trees'

# set presumed sampling probability
sampling_proba = 0.25

# a priori check for models BD, BDEI, BDSS
checkdeep(path_to_tree, model=BD, outputfile_png='BD_a_priori_check.png')
checkdeep(path_to_tree, model=BDEI, outputfile_png='BDEI_a_priori_check.png')
checkdeep(path_to_tree, model=BDSS, outputfile_png='BDSS_a_priori_check.png')


# model selection
model_BDEI_vs_BD_vs_BDSS = modeldeep(path_to_tree, sampling_proba, vector_representation=FULL)

# the selected model is BDSS

# parameter inference
param_BDSS = paramdeep(path_to_tree, sampling_proba, model=BDSS, vector_representation=FULL, 
                                 ci_computation=True)

import csv

# File path for the output CSV
output_csv_path = 'HIV_Zurich_BDSS_FFNN.csv'

# Write to CSV
with open(output_csv_path, 'w', newline='') as csvfile:
    writer = csv.writer(csvfile)
    # Assuming 'param_BDSS' is a dictionary or similar structured data
    for key, value in param_BDSS.items():
        writer.writerow([key, value])

