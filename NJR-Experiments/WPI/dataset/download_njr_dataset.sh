#!/bin/bash

url="https://zenodo.org/records/8015477/files/njr-1_dataset.zip?download=1"
output_file="njr-1_dataset.zip"

# Download the file
echo "Downloading the file..."
curl -L -o "$output_file" "$url"

# Check if the download was successful
if [ $? -eq 0 ]; then
    echo "Download complete. Unzipping the file..."
    
    # Unzip the file in the current directory
    unzip "$output_file" -d ./

    # Check if unzipping was successful
    if [ $? -eq 0 ]; then
        echo "Unzipping complete."
    else
        echo "Failed to unzip the file."
    fi
else
    echo "Failed to download the file."
fi

