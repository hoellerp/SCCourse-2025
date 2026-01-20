#!/bin/bash

#SBATCH --job-name=featureCounts_newAnno
#SBATCH --nodes=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=4G
#SBATCH --time=1:00:00
#SBATCH --output=/lisc/data/scratch/course/2025w300106/hoeller/logs/featureCounts_filtered.%j.log
#SBATCH --output=/lisc/data/scratch/course/2025w300106/hoeller/logs/featureCounts_filtered.%j.err
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=paul.arthur.hoeller@univie.ac.at

### Couting reads per gene
### ENVIRONMENTS
module load Subread
module list


### VARIABLES
gtfFile="/lisc/data/scratch/course/2025w300106/hoeller/filtered_gene_models.gtf"
bamFile="/lisc/data/scratch/course/2025w300106/hoeller/results/map/trimmed/filtered.bam"

### EXECUTION
# I used '-p' for paired-end reads
# I used '--countReadPairs' to count only one read per template
# I used '-C' to NOT count reads with ends on different chromosomes -> chimeric reads
# I used '-T' to specify the number of CPU threads
# I used '-s 2' to specify reversely stranded read counting
# I used '--minOverlap 3' to have only count reads with at least 3 overlapping bps
# I used '--primary' to only count primary alignments
# I used '-a' to specify the location/name of the annotation (.gtf) file
# I used '-o' to specify the name of the output file
featureCounts -p --countReadPairs -C -T 4 -s 2 --minOverlap 3 --primary -a $gtfFile -o ERR13719748.counts.newAnno.tsv $bamFile
