#!/bin/bash

filename=$1

if [ -z "$filename" ];
    then
    echo "N Problem with filename"
    exit 1
fi

nasm -f elf64 "$filename.asm" -o "$filename.o" &&
ld "$filename.o" -o "$filename" && 
echo "Build succesfull : ./$filename ,"

echo "Run it ??[1,0]"
read input
if [ "$input" = "1" ]; then
    ./"$filename"
else
    echo "Aborted"
fi