#!/bin/bash

#SBATCH --job-name=STAR
#SBATCH --nodes=1
#SBATCH --cpus-per-task=16
#SBATCH --mem=20G
#SBATCH --time=12:00:00
#SBATCH --output=/lisc/data/scratch/course/2025w300106/hoeller/logs/STAR.%j.log
#SBATCH --error=/lisc/data/scratch/course/2025w300106/hoeller/logs/STAR.%j.err
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=paul.arthur.hoeller@univie.ac.at

### ENVIRONMENT
module load STAR
module list

### EXECUTION
# I used '--genomeDir' to specify the directory in which the indexed genome is
# I used '--runThreadN' to specify how many many CPUs to use for the task
# I used '--readFilesIn' to specify the files to be mapped
# I used '--outFileNamePrefix' to specify both the path of the output files as well as the prefix which all resulting files will have
# I used '--outSAMstrandField intronMotif' to generate an XS strand attribute for alignments that have splice junctions (not discussed during course as far as I remember)
# I used '--outSAMtype BAM SortedByCoordinate' to create a sorted BAM file as the output
STAR --genomeDir /lisc/data/scratch/course/2025w300106/hoeller/Plit_STAR --runThreadN 16 --readFilesIn /lisc/data/scratch/course/2025w300106/hoeller/ERR13719748_1.fastq /lisc/data/scratch/course/2025w300106/hoeller/ERR13719748_2.fastq --outFileNamePrefix /lisc/data/scratch/course/2025w300106/hoeller/results/map/ERR13719748_Plit_ --outSAMstrandField intronMotif --outSAMtype BAM SortedByCoordinate
