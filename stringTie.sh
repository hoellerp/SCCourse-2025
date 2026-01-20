#!/bin/bash

#SBATCH --job-name=stringTie
#SBATCH --nodes=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=4G
#SBATCH --time=1:00:00
#SBATCH --output=/lisc/data/scratch/course/2025w300106/hoeller/logs/stringTie.%j.log
#SBATCH --error=/lisc/data/scratch/course/2025w300106/hoeller/logs/stringTie.%j.err
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=paul.arthur.hoeller@univie.ac.at

### ENVIRONMENT
module load StringTie
module list

### VARIABLES
inBAM="/lisc/data/scratch/course/2025w300106/hoeller/results/map/trimmed/filtered.bam"

### EXECUTION
# I use '-l' to define a prefix for my output transcripts
# I use '-o' to specify the name of my output file
# I use '-p' to specify the amount of CPUs to use
# I use '-j' to specify the minimal junction coverage
# I use '-g' to specify how large gaps between reads can maximally be
# I use '-m' to specify the minimal transcript lenghts
stringtie $inBAM -l Plit_zygote -o Plit.stringtie.gtf -p 4 -j 5 -g 200 -m 200
