#!/bin/bash

#SBATCH --job-name=trimmomatic
#SBATCH --nodes=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=16G
#SBATCH --time=4:00:00
#SBATCH --output=/lisc/data/scratch/course/2025w300106/hoeller/logs/trimmomatic.%j.log
#SBATCH --output=/lisc/data/scratch/course/2025w300106/hoeller/logs/trimmomatic.%j.err
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=paul.arthur.hoeller@univie.ac.at

### ENVIRONMENT
module load Trimmomatic
module list

### VARIABLES
wd="/lisc/data/scratch/course/2025w300106/hoeller"
outDir="$wd/results/trimmomatic"

### EXECUTION
echo "Started at $(date)"
mkdir -p $outDir

# I used PE for paired reads
# I used -summary to create a summary in the specified directory
# I used -baseout to specify a base file name from which the names of the resulting files are to be derived
trimmomatic PE -threads 4 -summary $outDir/ERR13719748_summary.txt $wd/ERR13719748_1.fastq $wd/ERR13719748_2.fastq -baseout $outDir/ERR13719748_ ILLUMINACLIP:/lisc/data/scratch/course/2025w300106/hoeller/trim_adapters.fa:2:30:10 SLIDINGWINDOW:4:20 MINLEN:75
echo "Finished at $(date)"
