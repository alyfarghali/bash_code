#!/bin/bash
#Line above must always be there and is called the shebang
#File Organizer
for file in *; do
    if [ "$file" == "organize.sh" ]; then
        continue
    fi
    if [ ! -d ${file##*.} ]; then
        mkdir ${file##*.}
    fi
    mv $file ${file##*.}
done

#A Bash script that takes a log file, finds all lines containing the word "error", 
#and saves them to a new file called errors.txt. 
#Then prints how many errors were found.

file=$1
keyword="error"
cat $file | grep $keyword > error.txt
count=$(wc -l < error.txt)
echo "Errors found: $count"