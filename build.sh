#!/bin/bash

filename=$1

if [ -z "$filename" ];
    then
    echo ">> Problem with filename"
    exit 1
fi

mkdir -p "$(dirname "./builds/$filename")"

nasm -f elf64 "$filename.asm" -o "./builds/$filename.o" &&
ld "./builds/$filename.o" -o "./builds/$filename" && 
echo "Build succesful : ./builds/$filename ,"

echo "Run it ??[1,0]"
read input
if [ "$input" = "1" ]; then
    ./builds/"$filename"
else
    echo "Aborted"
fi