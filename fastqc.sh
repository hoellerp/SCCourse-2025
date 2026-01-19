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
echo "Started job at $(date)"
mkdir $outDir
fastqc -t 2 -o $outDir $readsDir/ERR13719748_1.fastq $readsDir/ERR13719748_2.fastq
echo "Job finished at $(date)"
