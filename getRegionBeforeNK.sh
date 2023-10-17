#!/bin/bash

# This script can process a 6 columns BED format to output a new BED file with new region that is upstream N bps (set by vrange).

vrange=$1
file=$2

getRange() {
 awk -v range=$vrange '{
	chr=$1
	start=$2
	end=$3
	name=$4
	str=$6
	newStart=0
	newEnd=0
	
	if (str == "-"){
		newStart=end
		newEnd=newStart+range
		}
	else if (str == "+"){
		newEnd=start
		newStart=newEnd-range
		}
	else {
		newStart=start
		newEnd=end
		}
	printf "%s\t%d\t%d\t%s\t.\t%s\n",chr,newStart,newEnd,name,str
 }' $file
}

getRange $vrange $file

