#!/bin/bash

clear
g++ -o main main.cpp -std=c++20 -fsanitize=undefined -fsanitize=address -Wall -Wshadow 

# Run the program and capture both output and time
{ time ./main < ../input; } 2>&1 | tee output.txt

# Extract real time from output
real_time=$(grep real output.txt | awk '{print $2}')

# Convert real time to milliseconds
real_time_ms=$(echo "$real_time" | sed 's/m//;s/s//' | awk -F 'm|s' '{printf "%.0f\n", ($1 * 60 + $2) * 1000}')

# Display time taken
echo "Time taken: ${real_time_ms}ms"

# Clean up
rm main output.txt
