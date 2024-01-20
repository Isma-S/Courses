import os
from ete3 import Tree

# Directory containing your tree files
tree_directory = '/home/cjo63/Phyloformer/Reconstructed_trees/Over_50_tips/problematic_files'

# Loop through all files in the directory
for filename in os.listdir(tree_directory):
    if filename.endswith('.pf.nwk'):  # Check if it's a Newick file
        tree_file_path = os.path.join(tree_directory, filename)

        # Load the tree from the Newick file
        tree = Tree(tree_file_path)

        # Count the number of tips (terminal nodes)
        num_tips = len(tree.get_leaves())

        # Print the result for each tree
        print(f'Tree {filename} has {num_tips} tips.')
