#!/bin/bash

#SBATCH --job-name=fastqc
#SBATCH --nodes=1
#SBATCH --cpus-per-task=2
#SBATCH --mem=2G
#SBATCH --time=1:00:00
#SBATCH --output=/lisc/data/scratch/course/2025w300106/hoeller/logs/fastqc.%j.log
#SBATCH --output=/lisc/data/scratch/course/2025w300106/hoeller/logs/fastqc.%j.err
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=paul.arthur.hoeller@univie.ac.at

### ENVIRONMENT
module load FastQC

### VARIABLES
outDir="/lisc/data/scratch/course/2025w300106/hoeller/results/fastqc"
readsDir="/lisc/data/scratch/course/2025w300106/hoeller"

### EXECUTION
# I first used 'mkdir' to create the output directory
# I used '-t' to specify the number of threads to be used for the task
# I used '-o' to specify the output directory into which all output files will be put
echo "Started job at $(date)"
mkdir $outDir
fastqc -t 2 -o $outDir $readsDir/ERR13719748_1.fastq $readsDir/ERR13719748_2.fastq
echo "Job finished at $(date)"
