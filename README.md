# Nullability Inference Tools Evaluation Experiments

This repository contains all the scripts used for the experiments in the paper titled: **"A New Approach to Evaluating Nullability Inference Tools"**.

## Repository Structure

### 1. Bias-Illustration-Experiments (Related to Section 3 of the Paper)
The **Bias-Illustration-Experiments** folder contains all the scripts used to:
- Calculate the differences between pre-check and post-check versions of the benchmarks.
- Run the nullability checker and inference tools on the benchmarks.

For running inference tools and checkers on the pre- and post-check versions of benchmarks in **Bias-Illustration-Experiments**, we used the same scripts provided in **NJR-Experiments** that were used for the NJR benchmarks.

This folder also includes a CSV file with the results of our experiments:
- **bias-results.xlsx**: This file contains the results of our Bias-Illustration experiments.

### 2. NJR-Experiments (Related to Section 5 of the Paper)
The **NJR-Experiments** folder contains all the scripts used to run the checkers and inference tools on the **NJR benchmarks**.

A CSV file containing the results of all NJR experiments is included:
- **NJR-results.xlsx**: This file contains the results of running the checkers and inference tools on the NJR benchmarks.

#### Structure of NJR-Experiments
The **NJR-Experiments** folder is divided into four subfolders:
1. **WPI**: Contains scripts related to the Whole Program Inference (WPI) tool.
2. **NullGTN**: Contains scripts related to the NullGTN inference tool.
3. **Annotator**: Contains scripts related to the Annotator inference tool.
4. **General**: Contains general scripts to:
   - Run **CFNullness** and **NullAway** on the inferred versions.
   - Conduct dynamic comparison experiments.
   - Produce result tables from the experiments.

Each of these subfolders (WPI, NullGTN, Annotator) includes a **README** that explains the usage and steps to run the respective inference tool.

## Summary of Experimental Results
- **bias-results.xlsx**: Results of the Bias-Illustration experiments.
- **NJR-results.xlsx**: Results of the experiments conducted on NJR benchmarks using the three inference tools.

---

For more detailed instructions on how to use the scripts for each tool, please refer to the **README** files in the respective folders.
