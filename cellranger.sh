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
# I used 'mkdir -p ${od}' to create the output directory
# I used 'cd ${od}' to move into the output directory (since CellRanger puts the files into the current directory)
# I used '--transcriptome' to specify the location of our transcriptome reference
# I used '--fastqs' to specify the directory of the fastq files to be used
# I used '--force-cells 10000' to force CellRanger to end up with 10000 cells (regardless of quality)
# I used '--nosecondary' to disable secondary analysis
# I used '-- localcores' to specify the max. number of CPUs to use for the task
# I used '--sample'to specify the prefix of the filenames in the fastq files which are to be used
# I used '--id' to specify the name of the output folder
# I used --create-bam false' so that no BAM file will be generated
mkdir -p ${od}
cd ${od}
cellranger count --transcriptome $index --fastqs $fastq_dir --force-cells 10000 --nosecondary --localcores 16 --sample $sample --id $id --create-bam false
