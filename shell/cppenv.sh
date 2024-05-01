#!/bin/bash

clear
g++ -o main main.cpp -std=c++20 -fsanitize=undefined -fsanitize=address -Wall -Wshadow 

# Run the program and capture both output and time
{ /usr/bin/time -f "%e" ./main < ../input; } 2> output.txt | tee -a output.txt

# Extract real time from output
real_time=$(tail -n 1 output.txt)

# Convert real time to milliseconds
real_time_ms=$(awk -v rtime="$real_time" 'BEGIN{ printf "%.0f\n", rtime * 1000 }')

# Display time taken
echo "Time taken: ${real_time_ms}ms"

# Clean up
rm main output.txt
