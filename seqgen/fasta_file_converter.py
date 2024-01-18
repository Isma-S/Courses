import os

def wrap_sequence(sequence, line_length=60):
    """Wrap the sequence to the specified line length."""
    return '\n'.join(sequence[i:i+line_length] for i in range(0, len(sequence), line_length))

input_dir = '/home/cjo63/seqgen/Length_100_L1.0_M0.25'  # Directory containing your files
output_dir = '/home/cjo63/seqgen/FASTA_files_L1.0_M0.25'  # Directory to save the FASTA files

# Make sure the output directory exists
os.makedirs(output_dir, exist_ok=True)

# Process each file in the input directory
for filename in os.listdir(input_dir):
    input_file = os.path.join(input_dir, filename)
    output_file = os.path.join(output_dir, filename.replace('.almost_FASTA', '.fasta'))  # Change the extension to .fasta

    with open(input_file, 'r') as file:
        lines = file.readlines()

    with open(output_file, 'w') as new_file:
        first_line = True  # Flag to identify the first line
        for line in lines:
            if first_line:  # Skip the first line
                first_line = False
                continue

            if line.strip():  # Check if the line is not just whitespace
                parts = line.split(maxsplit=1)
                if len(parts) == 2:
                    seq_name, seq_data = parts
                    # Write the sequence name in FASTA format, replacing 't' with 'n'
                    new_file.write('>' + seq_name.replace('t', 'n') + '\n')
                    # Write the wrapped sequence data
                    new_file.write(wrap_sequence(seq_data.strip()) + '\n')
