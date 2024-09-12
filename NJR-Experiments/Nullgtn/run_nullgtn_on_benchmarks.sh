#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Function to display usage
usage() {
    echo "Usage: $0 [-s]"
    echo "  -s  Skip benchmarks with existing log files"
    exit 1
}

# Parse command-line options
SKIP_EXISTING_LOGS=false
while getopts "s" opt; do
    case $opt in
        s)
            SKIP_EXISTING_LOGS=true
            ;;
        *)
            usage
            ;;
    esac
done

# Activate the conda environment

# Define the base directory for nullgtn
BASE_DIR="/home/ea442/nullgtn_previously/nullgtn-artifact/"
OUT_DIR="${BASE_DIR}out/"
TERMINAL_OUTPUT_DIR="${OUT_DIR}terminal_output/"

# Create the terminal_output directory if it doesn't exist
mkdir -p "${TERMINAL_OUTPUT_DIR}"

# Automatically populate the BENCHMARKS array from the minstripped directory
BENCHMARKS=($(find "${BASE_DIR}minstripped" -maxdepth 1 -mindepth 1 -type d -exec basename {} \;))

# Iterate over each benchmark and run nullgtn
for BENCHMARK in "${BENCHMARKS[@]}"; do
    INPUT_DIR="${BASE_DIR}minstripped/${BENCHMARK}/"
    OUTPUT_DIR="${OUT_DIR}${BENCHMARK}/"
    LOG_FILE="${TERMINAL_OUTPUT_DIR}${BENCHMARK}.log"

    if [ "$SKIP_EXISTING_LOGS" = true ] && [ -f "$LOG_FILE" ]; then
        echo "$(date) - Skipping benchmark ${BENCHMARK}, log file already exists."
        continue
    fi

    # Log the start of the benchmark with the timestamp
    echo "$(date) - Running Nullgtn for benchmark: ${BENCHMARK}"
    echo "$(date) - Running Nullgtn for benchmark: ${BENCHMARK}" >> "$LOG_FILE"

    # Run the nullgtn tool and save the terminal output to a log file with timestamps
    echo "$(date) - Starting nullgtn.sh" >> "$LOG_FILE"
    ./nullgtn.sh "${BASE_DIR}" "${INPUT_DIR}" "${OUTPUT_DIR}" &>> "$LOG_FILE"
    echo "$(date) - Finished nullgtn.sh" >> "$LOG_FILE"
done

echo "$(date) - All benchmarks have been processed."

