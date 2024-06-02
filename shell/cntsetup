#!/bin/bash

task_ids="ABCDEFGHI"
folder_name=$1
task_count=$(( $2 ))

mkdir $folder_name
cd $folder_name

for (( i=0; i<task_count; i++ )); do
    task_id="${task_ids:i:1}"
    mkdir $task_id
    cd $task_id
    cp /home/akos/.config/Code/User/snippets/contest-template.cpp _main.cpp
    cd ..
done

touch input

code .