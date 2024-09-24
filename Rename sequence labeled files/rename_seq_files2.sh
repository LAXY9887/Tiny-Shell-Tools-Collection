#!/bin/bash

# Working dir
inputPath=$1

# Prefix setting
prefix=$2

# Index separater
sep="."

# Go to workdir
cd $inputPath

# Program
for i in *
  do 
    mv "${i}" "${prefix}${i/${sep}*./.}"
  done