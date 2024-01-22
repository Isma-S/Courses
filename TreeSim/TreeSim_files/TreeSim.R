# Load necessary libraries
library(TreeSim)
library(ape)
library(paleotree)

# Parameters
age <- 10      # Age of the tree in million years
numbsim <- 100   # Number of trees to simulate
lambda <- 1.0  # Speciation rate
mu <- 0.5      # Extinction rate
sampling_probability <- 0.8

# Simulating trees
phy_list <- sim.bd.age(age = age, numbsim = numbsim, lambda = lambda, mu = mu, complete = TRUE)

# Filter out valid trees
valid_phy <- phy_list[sapply(phy_list, function(x) inherits(x, "phylo"))]

# Check the number of valid trees
cat("Number of valid trees:", length(valid_phy), "\n")

# Function to prune trees
prune_tree <- function(tree) {
  # Date the nodes of the tree
  node_dates <- dateNodes(tree)

  # Identifying tips at present (age 0)
  tips_at_present <- names(node_dates)[which(node_dates == 0)]

  # Removing tips at present
  if (length(tips_at_present) > 0) {
    tree <- drop.tip(tree, tips_at_present)
  }

  # For each remaining tip, drop it with probability s
  remaining_tips <- tree$tip.label
  tips_to_drop <- remaining_tips[sapply(remaining_tips, function(x) runif(1) < sampling_probability)]

  if (length(tips_to_drop) > 0) {
    tree <- drop.tip(tree, tips_to_drop)
  }

  return(tree)
}

# Apply the function to all valid trees
pruned_trees <- lapply(valid_phy, prune_tree)

# Output the pruned trees (first few)
cat("Pruned trees (first few):\n")
print(head(pruned_trees))

# Directory to save the trees
# Update this path to a valid directory on your Linux server
output_directory <- "/home/cjo63/TreeSim_files/tree_files/tree_files_lambda_1.0_mu_0.5"

# Create the directory if it doesn't exist
if (!dir.exists(output_directory)) {
  dir.create(output_directory, recursive = TRUE)
}

# Write each tree to a file
for (i in seq_along(pruned_trees)) {
  file_name <- file.path(output_directory, paste0("pruned_tree_", i, ".nwk"))
  write.tree(pruned_trees[[i]], file = file_name)
}
