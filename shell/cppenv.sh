#!/bin/bash

current_dir=$(pwd)
required_prefix=~/repos/contest-prog/
if [[ "$current_dir" != $required_prefix* ]]; then
    exit 0
fi

clear
g++ -o main *main.cpp -std=c++20 -fsanitize=undefined,address -Wall -Wshadow -DLOCAL -I/home/akos/cpp-include/

./main < ../input

echo

rm main
