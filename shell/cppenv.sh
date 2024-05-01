#!/bin/bash

clear
g++ -o main main.cpp -std=c++20 -fsanitize=undefined -fsanitize=address -Wall -Wshadow 

# Run the program and capture time
{ time ./main < ../input; } 2> time_output.txt

# Extract real time from output
real_time=$(grep real time_output.txt | awk '{print $2}')

# Convert real time to milliseconds
real_time_ms=$(echo "$real_time" | awk -F 'm|s' '{printf "%.0f\n", ($1 * 60 + $2) * 1000}')

# Display time taken
echo \n\n"Time taken: ${real_time_ms}ms"

# Clean up
rm main time_output.txt
