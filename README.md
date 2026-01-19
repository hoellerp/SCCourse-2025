# scCourse-2025w
Collection of scripts for the 1st part of the SC data analysis course
## Content of repository
| File | Description |
| ---- | ----------- |
| star_align.sh | used to align short RNA reads to a reference genome |
| fastqc.sh | used to perform a quality control check of our raw RNA reads -> results in an HTML file giving graphic summaries of multiple parameters |
| trimmomatic.sh | used to trim reads that do not meet specified parameters (low-quality reads, reads that are too short) from our RNA-seq data, as well as trimming adapters | 
| star_align_trimmed.sh | used to align our newly trimmed RNA reads to a reference genome |
| featureCount.sh | used to get an approximation of gene expression levels by counting how many reads are mapped for each gene |
| stringTie.sh | used to take our trimmed RNA reads and assemble them into a new annotation file (.gtf) |
| featureCount_newAnno.sh | used to get a proxy of the expression levels using our newly assembled annotation |
| filter.seqs.py | python script used to remove "." from the amino acid sequence of our protein sequences - since they caused issues running 'emapper' |
| emapper.sh | used to perform functional annotation on an RNA/AA sequence - assigns functions to genes based on the sequence and their proposed orthologs  |
| cellranger.sh | used to map scRNA reads to a reference genome and generating a count matrix (similar to 'featureCounts') containing the number of reads associated with the individual cells |
