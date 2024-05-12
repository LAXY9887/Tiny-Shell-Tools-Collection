# Tiny-Shell-Tools-Collection
This repo is a collection of simple shell scripts that aids data processing.

**Update 2024-05-12**

## What's new?

## **MergeCols**

`MergeCols.sh` is a script that collect files in the given working directory and summary them in to a table.

This script can help summary the HTseq-count results into a table, or summary any kind of 2 column format gene count files. (See [Wiki page](https://github.com/LAXY9887/Tiny-Shell-Tools-Collection/wiki#3-mergecols))

*Usage:* `MergeCols.sh [workdir] [outputfile]`

*Example:* `MergeCols.sh ./Counts Example_merged.txt`

Example file content `File1.txt`
|Gene|count|
|----|-----|
|GeneA|2|
|GeneB|0|
|GeneC|74|
|GeneD|3|

Example output content `Merge.txt`

|Gene|File1.txt|File2.txt|File3.txt|
|----|----|----|----|
|GeneA 1|0|5|
|GeneB 5|7|4|
|GeneC 5|1|3|
|GeneD 9|0|2|

## Tool collections

### **1. getRegionBeforeNK.sh** 

`getRegionBeforeNK.sh` is a script that processes a BED file and generate a new one that is upstream N bps.

*Usage:* `getRegionBeforeNK.sh [range] [input BED file]`

*Example:* `getRegionBeforeNK.sh 3000 Test.bed > Test_upstream3k.bed`

### **2. Configure pipline path**

This tool helps configuring a customized RNA-seq pipline script of mine.

Any variables, includes software paths, slurm settings, genome index, region BED files, etc., can be recorded in the `c.0_RNAseq_QuantTERRA.cfg` file.

The `0_Configure_Setting.sh` script will parse the settings in the configure file and automatically edit all pipeline scripts to the user's settings.

*Usage & example:* `0_Configure_Setting.sh c.0_RNAseq_QuantTERRA.cfg`

## **3. MergeCols**

`MergeCols.sh` is a script that collect files in the given working directory and summary them in to a table.

This script can help summary the HTseq-count results into a table, or summary any kind of 2 column format gene count files. (See [Wiki page](https://github.com/LAXY9887/Tiny-Shell-Tools-Collection/wiki#3-mergecols))

*Usage:* `MergeCols.sh [workdir] [outputfile]`

*Example:* `MergeCols.sh ./Counts Example_merged.txt`
