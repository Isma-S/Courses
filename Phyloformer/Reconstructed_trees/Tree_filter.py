import os
import shutil

def count_leaves_in_newick(tree_newick):
    return tree_newick.count('n') // 2  # Count leaves in Newick format

def main(source_directory, target_directory):
    # Ensure target directory exists
    os.makedirs(target_directory, exist_ok=True)

    for filename in os.listdir(source_directory):
        if filename.endswith('.nwk'):  # Assuming all tree files end with .nwk
            file_path = os.path.join(source_directory, filename)
            with open(file_path, 'r') as file:
                tree_newick = file.read().strip()
                leaf_count = count_leaves_in_newick(tree_newick)
                # Check if the tree has 50 or more leaves
                if leaf_count >= 50:
                    # Copy the file to the target directory
                    shutil.copy(file_path, os.path.join(target_directory, filename))

if __name__ == "__main__":
    source_directory = '/home/cjo63/Phyloformer/Reconstructed_trees'
    target_directory = '/home/cjo63/Phyloformer/Reconstructed_trees/Over_50_tips'
    main(source_directory, target_directory)
