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

# I used 'PE' for paired end reads
# I used '-summary' to create a summary in the specified directory
# I used '-baseout' to specify a base file name from which the names of the resulting files are to be derived
# I used 'ILLUMINACLIP' to trim the adapters and other sequencing related seqs from our RNA reads
  ## I used the settings '2:30:10' to specify the maximal amount of mismatches allowed (2), to set a threshold for the accuracy of the paired end reads to be aligned (30), to specify the accuracy needed between the adapter seq and the reads (10)
# I used 'SLIDINGWINDOW' to "create" a sliding window of a set number of bases, which slides across the seq averaging the quality of the bases - once the average quality falls below a specified threshold the seq is cut
  ## I used the settings '4:20' to use a sliding window of 4 bases which trims the seq when the average quality drops below 20
# I used 'MINLEN' to specify a minimal length the reads need to have - if a read is too short it is dropped
trimmomatic PE -threads 4 -summary $outDir/ERR13719748_summary.txt $wd/ERR13719748_1.fastq $wd/ERR13719748_2.fastq -baseout $outDir/ERR13719748_ ILLUMINACLIP:/lisc/data/scratch/course/2025w300106/hoeller/trim_adapters.fa:2:30:10 SLIDINGWINDOW:4:20 MINLEN:75
echo "Finished at $(date)"
