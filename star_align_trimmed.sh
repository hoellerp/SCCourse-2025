#!/bin/bash

#SBATCH --job-name=STAR_trimmed
#SBATCH --nodes=1
#SBATCH --cpus-per-task=16
#SBATCH --mem=20G
#SBATCH --time=12:00:00
#SBATCH --output=/lisc/data/scratch/course/2025w300106/hoeller/logs/STAR_trimmed.%j.log
#SBATCH --error=/lisc/data/scratch/course/2025w300106/hoeller/logs/STAR_trimmed.%j.err
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=paul.arthur.hoeller@univie.ac.at

### ENVIRONMENT
module load STAR
module list

### VARIABLES
wd="/lisc/data/scratch/course/2025w300106/hoeller"
readDir="$wd/results/trimmomatic"


### EXECUTION
# I used 'mkdir' to create the directory into which the outfiles will be put
  ## I used '-p' to create parent directories as needed
# I used '--runThreadN' to specify how many many CPUs to use for the task
# I used '--readFilesIn' to specify the files to be mapped
# I used '--outFileNamePrefix' to specify both the path of the output files as well as the prefix which all resulting files will have
# I used '--outSAMstrandField intronMotif' to generate an XS strand attribute for alignments that have splice junctions (not discussed during course as far as I remember)
# I used '--outSAMtype BAM SortedByCoordinate' to create a sorted BAM file as the output
echo "Started at $(date)"
mkdir -p $wd/results/map/trimmed

STAR --genomeDir $wd/Plit_STAR --runThreadN 16 --readFilesIn $readDir/ERR13719748__1P $readDir/ERR13719748__2P --outFileNamePrefix $wd/results/map/trimmed/ERR13719748_Plit_ --outSAMstrandField intronMotif --outSAMtype BAM SortedByCoordinate

echo "Finished at $(date)"

