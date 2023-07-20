#!/bin/bash
> test.txt

for((i=0;i<10;i+=1)); do
    echo $((RANDOM % 10)) >> test.txt;
done