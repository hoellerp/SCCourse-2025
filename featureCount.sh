#!/bin/bash

#SBATCH --job-name=featureCounts
#SBATCH --nodes=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=4G
#SBATCH --time=1:00:00
#SBATCH --output=/lisc/data/scratch/course/2025w300106/hoeller/logs/featureCounts.%j.log
#SBATCH --output=/lisc/data/scratch/course/2025w300106/hoeller/logs/featureCounts.%j.err
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=paul.arthur.hoeller@univie.ac.at

### Couting reads per gene
### ENVIRONMENTS
module load Subread
module list


### VARIABLES
gftFile="/lisc/data/scratch/course/2025w300106/hoeller/test.gft"
bamFile="/lisc/data/scratch/course/2025w300106/hoeller/results/map/trimmed/filtered.bam"

### EXECUTION
# I used -p for paired ends
# I used --countReadPairs to count only one read per template
# I used --primary to only count primary alignments
# I used --minOverlap 3 to have only count reads with at least 3 overlapping bps
# I believe this is a reverse stranded library
featureCounts -p --countReadPairs -C -T 4 -s 2 --minOverlap 3 --primary -a $gftFile -o ERR13719748.counts.tsv $bamFile


