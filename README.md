# Tiny-Shell-Tools-Collection
This repo is a collection of simple shell scripts that aids data processing.

**Update 2023-10-22**

## What's new?

**1. Configure pipline path**

This tool helps configuring a customized RNA-seq pipline script of mine.

Any variables, includes software paths, slurm settings, genome index, region BED files, etc., can be recorded in the `c.0_RNAseq_QuantTERRA.cfg` file.

The `0_Configure_Setting.sh` script will parse the settings in the configure file and automatically edit all pipeline scripts to the user's settings.

*Usage & example:* `0_Configure_Setting.sh c.0_RNAseq_QuantTERRA.cfg`

### **Notice!** 

All pipeline scripts, `c.0_RNAseq_QuantTERRA.cfg` and `0_Configure_Setting.sh` should be under the same directory.

The format of the configure file is as follow:

```
## Genome
CHM13GENOME:/staging/biology/ls807terra/0_genomes/star_index/CHM13_human

## SLURM setting
PARTITION:186
MEMORY:186
NCORE:28

## Pipeline workdir, Please specifiy this!
WORKDIR:../

## TERRA quantification region files.

# TERRA regions for TERRA counts.
QREGION:/staging/biology/ls807terra/0_bedfiles/hTERRA/CHM13_TERRA_region_v6.bed

# Human CHM13 GTF for total gene count.
QGTF:/staging/biology/ls807terra/0_genomes/genome_gtf/CHM13/CHM13_v2.0.gtf

# CHM13 cytoband file with TERRA regions for telomerehunter.
CYTOBAND:/staging/biology/ls807terra/0_bedfiles/hTERRA/chm13v2.0_cytobands_allchrs_Add_TERRA_v3.bed

## Software path

# SRAToolKit fastq-dump
FASTQDUMP:/opt/ohpc/Taiwania3/pkg/biology/SRAToolkit/sratoolkit_v2.11.1/bin/fastq-dump

# SRAToolKit prefetch
PREFETCH:/opt/ohpc/Taiwania3/pkg/biology/SRAToolkit/sratoolkit_v2.11.1/bin/prefetch

# Trimgalore
TRIMGALORE:/opt/ohpc/Taiwania3/pkg/biology/TrimGalore/TrimGalore_v0.6.3/trim_galore

# Cutadapt
CUTADAPT:/opt/ohpc/Taiwania3/pkg/biology/Cutadapt/Cutadapt_v2.3/bin/cutadapt

# samtools
SAMTOOLS:/opt/ohpc/Taiwania3/pkg/biology/SAMTOOLS/SAMTOOLS_v1.13/bin/samtools

# STAR alignment
STARALIGN:/opt/ohpc/Taiwania3/pkg/biology/STAR/STAR_v2.7.9a/bin/Linux_x86_64/STAR

# deeptools bamcoverage
BAMCOV:/opt/ohpc/Taiwania3/pkg/biology/deepTools/deepTools_v3.3.1/bin/bamCoverage

# UCSC tools bigwig to bedgraph
BW2BGD:/staging/biology/ls807terra/0_Programs/UCSC_tools/bigWigToBedGraph

# HTseq-count
HTSEQ:/staging/biology/ls807terra/0_Programs/anaconda3/envs/RNAseq_quantTERRA/bin/htseq-count

# Telomerehunter for TERRA count
THNTER:/staging/biology/ls807terra/0_Programs/anaconda3/envs/telomereHunter/bin/telomerehunter

# BAM tools for BAM merge
BAMTOOL:/staging/biology/ls807terra/0_Programs/bamtools/build/bin/bamtools
```
### Configure file's Rules: 

1. To comment or annotate, please add a "#" at the start of a line.

2. Format -> TOOL_ID:/path/to/Software , separated by ":".

3. Please update the software path if they were changed.

4. To rigister a new tool and its path:

-> 4.1 In a pipeline script (file name: *_ps_*.sh), write:
 	       ''' software="TOOL_ID"
 	           # To use the software
 	           ${software} -options [files] ... '''

-> 4.2 In this configure file, write:
 	       ''' TOOL_ID:/path/to/this/tool

-> 4.3 Run the script: sh 0_Configure_Setting.sh this_configure_file.cfg
	       This will reconginze the "TOOL_ID" in a script and replace it by "/path/to/this/tool"

5. Make sure that all pipeline script (file name: *_ps_*.sh) are in the same directory with 0_Configure_Setting.sh and this configure file.


## Tool collections

**1. getRegionBeforeNK.sh** 

`getRegionBeforeNK.sh` is a script that processes a BED file and generate a new one that is upstream N bps.

*Usage:* `getRegionBeforeNK.sh [range] [input BED file]`

*Example:* `getRegionBeforeNK.sh 3000 Test.bed > Test_upstream3k.bed`

**2. Configure pipline path**

This tool helps configuring a customized RNA-seq pipline script of mine.

Any variables, includes software paths, slurm settings, genome index, region BED files, etc., can be recorded in the `c.0_RNAseq_QuantTERRA.cfg` file.

The `0_Configure_Setting.sh` script will parse the settings in the configure file and automatically edit all pipeline scripts to the user's settings.

*Usage & example:* `0_Configure_Setting.sh c.0_RNAseq_QuantTERRA.cfg`
