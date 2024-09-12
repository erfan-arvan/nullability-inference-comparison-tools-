# Running NullGTN on NJR Benchmarks

This guide explains how to set up and run **NullGTN** on **NJR benchmarks** using the provided scripts.

## Step 1: Download the NullGTN Artifact

1. First, download the **NullGTN artifact** by executing the following command:
    ```bash
    ./download_nullgtn.sh
    ```
    This script downloads the NullGTN artifact from its source.

2. Follow the instructions in the **NullGTN artifact's README** to install and set it up properly.

## Step 2: Prepare the NJR Dataset

1. Copy the `download_njr_dataset.sh`, `reorg.sh`, and `run_nullgtn_on_benchmarks.sh` scripts from the current directory to their respective folders:
    ```bash
    cp ./download_njr_dataset.sh ./reorg.sh /path/to/nullgtn-artifact/minstripped/
    cp ./run_nullgtn_on_benchmarks.sh /path/to/nullgtn-artifact/
    ```

2. After copying, navigate to the `minstripped` folder in the **NullGTN artifact** directory and run the `download_njr_dataset.sh` script to download the NJR dataset:
    ```bash
    cd /path/to/nullgtn-artifact/minstripped
    ./download_njr_dataset.sh
    ```

3. Once the NJR dataset has been downloaded, run the `reorg.sh` script to reorganize the dataset:
    ```bash
    ./reorg.sh
    ```

## Step 3: Running NullGTN on the Benchmarks

1. After preparing the NJR dataset, navigate to the root of the **NullGTN artifact** directory:
    ```bash
    cd /path/to/nullgtn-artifact/
    ```

2. Run the `run_nullgtn_on_benchmarks.sh` script to execute **NullGTN** on the benchmarks:
    ```bash
    ./run_nullgtn_on_benchmarks.sh
    ```

    This script will run **NullGTN** on the NJR benchmarks and place the resulting annotated version of each benchmark in the `out` directory inside the **NullGTN artifact**.

## Summary of Commands:
```bash
# Step 1: Download the NullGTN artifact
./download_nullgtn.sh

# Step 2: Copy and run the scripts in the respective folders
cp ./download_njr_dataset.sh ./reorg.sh /path/to/nullgtn-artifact/minstripped/
cp ./run_nullgtn_on_benchmarks.sh /path/to/nullgtn-artifact/
cd /path/to/nullgtn-artifact/minstripped
./download_njr_dataset.sh
./reorg.sh

# Step 3: Run NullGTN on the benchmarks
cd /path/to/nullgtn-artifact/
./run_nullgtn_on_benchmarks.sh

