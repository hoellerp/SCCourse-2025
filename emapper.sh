#!/bin/bash

#SBATCH --job-name=emapper
#SBATCH --nodes=1
#SBATCH --cpus-per-task=16
#SBATCH --mem=32G
#SBATCH --time=12:00:00
#SBATCH --output=/lisc/data/scratch/course/2025w300106/hoeller/logs/emapper.%j.log
#SBATCH --output=/lisc/data/scratch/course/2025w300106/hoeller/logs/emapper.%j.err
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=paul.arthur.hoeller@univie.ac.at

### ENVIRONMENTS
module load eggnogmapper/2.1.13-foss-2024a
module list

### VARIABLES
input="/lisc/data/scratch/course/2025w300106/hoeller/proteins.filtered.fasta"
output="/lisc/data/scratch/course/2025w300106/hoeller/results/emapper/"

### EXECUTION
mkdir -p ${output}
# I used '-i' to specify my input fasta file
# I used '--output_dir' to specify where to put the output files
# I used '--cpu' to specify how many CPUs to use for the task
# I used '--itype' to specify that the input data is proteins (redundant since proteins is the default anyway)
# I used '-m diamond' to specify that I want to run the search with diamond
# I used '--evalue 1e-5' to set the cut-off threshold of the e-value to 1e-5
# I used '-go_evidence experimental' to set the gene ontology to experimental
# I used '-o' to specify a prefix for my output files
# I used '--override' to override existing output files
emapper.py -i ${input} --output_dir ${output} --cpu 16 --itype proteins -m diamond --evalue 1e-5 --go_evidence experimental -o Plit_FunctionalAnno_ --override

