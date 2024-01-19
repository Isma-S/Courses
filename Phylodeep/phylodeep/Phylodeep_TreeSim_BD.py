from phylodeep import BD, FULL
from phylodeep.checkdeep import checkdeep
from phylodeep.modeldeep import modeldeep
from phylodeep.paramdeep import paramdeep


path_to_tree = '/home/cjo63/phylodeep/phylodeep/TreeSim_output/tree_files/tree_1.nwk'

# set presumed sampling probability
sampling_proba = 1.00

# a priori check for BD model
checkdeep(path_to_tree, model=BD, outputfile_png='BD_a_priori_check.png')

# the selected model is BD

# parameter inference
param_BD = paramdeep(path_to_tree, sampling_proba, model=BD, vector_representation=FULL, 
                                 ci_computation=True)
