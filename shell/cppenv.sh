#!/bin/bash

clear
g++ -o main *main.cpp -std=c++20 -fsanitize=undefined,address -Wall -Wshadow -DLOCAL

./main < ../input

echo

rm main
