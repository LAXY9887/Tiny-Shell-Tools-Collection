#!/bin/bash

# File Example

# File1.txt
# Gene  count
# GeneA 2
# GeneB 0
# GeneC 74
# GeneD 3
# ...

# This script collect files in workdir, extract and merge the 2nd column of each file together.

# The second part of this script is to transpose the result to generate a table.

# Output Example
# Gene  File1.txt   File2.txt   File3.txt   ...
# GeneA 1           0           5           ...
# GeneB 5           7           4           ...
# GeneC 5           1           3           ...
# GeneD 9           0           2           ...
# ...   ...         ...         ...         ...

workdir=$1
output=$2

for i in $(ls $workdir)
do
    # 取得檔案名稱
    filename=$i

    # 將檔案名稱作為欄首寫入合併後的檔案
    echo -ne "$filename\t" >> merged_file.txt

    # 讀取檔案的第二欄數字並寫入合併後的檔案
    awk '{print $2}' $workdir/${i} | tr '\n' '\t' >> merged_file.txt
    
    # 換行
    echo "" >> merged_file.txt

done

# 將 merged_file.txt 的內容轉置並存入 transposed_file.txt
awk -v outfile=$output '
{
    for (i=1; i<=NF; i++)  {
        if (NR==1) {
            matrix[i] = $i
        } else {
            matrix[i] = matrix[i] "\t" $i
        }
    }
}
END {
    for (i=1; i<=NF; i++) {
        print matrix[i] > outfile
    }
}' merged_file.txt

rm merged_file.txt