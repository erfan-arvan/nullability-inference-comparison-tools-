# WPI and Checker Framework Nullness Checker on NJR Benchmarks

This project is designed to run the Whole Program Inference (WPI) and the Checker Framework's nullness checker on the NJR benchmarks, as outlined in section 5 of the paper.

## Steps to Run the Project

1. **Navigate to the dataset directory**:
    ```bash
    cd dataset
    ```

2. **Download the NJR dataset**:
    ```bash
    ./download_njr_dataset.sh
    ```

3. **Navigate to the WPI directory**:
    ```bash
    cd wpi
    ```

4. **Run the WPI process**:
    ```bash
    python3 run_wpi.py .
    ```

    This script manages the WPI outer layer on all benchmarks and logs the results produced by the tool. After execution, the resulting `.ajava` files for each benchmark will be stored in:
    ```
    root-dir/dataset/benchmark-directory/wpi-out
    ```

5. **View Checker Framework Results**:
    The results of running the Checker Framework's nullness checker, both before and after WPI inference, can be found in:
    ```
    root-dir/wpi/checkerframework
    ```

