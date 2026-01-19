#!/bin/bash

#SBATCH --job-name=CellRanger
#SBATCH --nodes=1
#SBATCH --cpus-per-task=16
#SBATCH --mem=64G
#SBATCH --time=12:00:00
#SBATCH --output=/lisc/data/scratch/course/2025w300106/hoeller/logs/cellranger.%j.log
#SBATCH --output=/lisc/data/scratch/course/2025w300106/hoeller/logs/cellranger.%j.err
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=paul.arthur.hoeller@univie.ac.at

### ENVIRONMENTS
module load CellRanger
module list

### VARIABLES
wd="/lisc/data/scratch/course/2025w300106"
index="${wd}/common/NV2_fluo"
fastq_dir="${wd}/common/blastula.12h/run1,${wd}/common/blastula.12h/run2,${wd}/common/blastula.12h/run3"
sample="89085"
od="${wd}/hoeller/results/cellranger"
id="blastula_12h"

### EXECUTION
mkdir -p ${od}
cd ${od}
cellranger count --transcriptome $index --fastqs $fastq_dir --force-cells 10000 --nosecondary --localcores 16 --sample $sample --id $id --create-bam false
