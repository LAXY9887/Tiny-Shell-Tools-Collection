#!/bin/bash

# File names must be labeled with non-duplicated index number and "." at begining.
# 1.Test file A.pdf
# 2.Test file B.pdf
# 3.Test file C.pdf
# 4.Test file D.pdf
# ...

#Working directory
inputPath=$1

#File name prefix
prefix=$2

#Move to work dir
cd $inputPath

#Calculate file number
fileNum=$(ls | wc -l)

#Program
for i in $(seq 1 $fileNum)

  do

  #Get file names
  name=$(echo ${i}.*)

  #Get file extension
  ext="${name##*.}"

  #Specify Target file
  target=$(ls | grep "^${i}\.")

  #Get new name by sed command
  newName=$(echo ${i}.*.${ext} | sed "s#^${i}\..*#${prefix}${i}.${ext}#g")

  #Rename target file by mv command
  mv -i "$target" $newName

  done
  