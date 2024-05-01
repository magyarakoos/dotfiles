#!/bin/bash

clear
g++ -o main main.cpp -std=c++20 -fsanitize=undefined -fsanitize=address -Wall -Wshadow 

output=$(time ./main < ../input)

real_time=$(echo "$output" | grep real | awk '{print $2}')

real_time_ms=$(echo "$real_time" | sed 's/m//;s/s//' | awk -F 'm|s' '{printf "%.0f\n", ($1 * 60 + $2) * 1000}')

echo "Time taken: ${real_time_ms}ms

