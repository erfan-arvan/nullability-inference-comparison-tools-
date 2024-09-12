#This is to reorganize the benchmarks' structure to be compatible with NullGTN
#!/bin/bash

# Base directory containing the benchmarks
BASE_DIR="."

# Iterate over each benchmark directory
for BENCHMARK_DIR in "$BASE_DIR"/*; do
    # Ensure we are only processing directories
    if [ -d "$BENCHMARK_DIR" ]; then
        # Get the benchmark name
        BENCHMARK_NAME=$(basename "$BENCHMARK_DIR")

        # Define the new directory structure
        NEW_DIR="${BENCHMARK_DIR}/${BENCHMARK_NAME}"

        # Create the new directory structure
        mkdir -p "$NEW_DIR"

        # Move the src directory to the new structure
        if [ -d "${BENCHMARK_DIR}/src" ]; then
            mv "${BENCHMARK_DIR}/src" "$NEW_DIR/"
        fi
    fi
done

echo "Benchmarks have been reorganized."


