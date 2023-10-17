# Tiny-Shell-Tools-Collection
This repo is a collection of simple shell scripts that aids data processing.

## What's new?

**1. getRegionBeforeNK.sh** 

`getRegionBeforeNK.sh` is a script that processes a BED file and generate a new one that is upstream N bps.

*Usage:* `getRegionBeforeNK.sh [range] [input BED file]`

*Example:* `getRegionBeforeNK.sh 3000 Test.bed > Test_upstream3k.bed`
