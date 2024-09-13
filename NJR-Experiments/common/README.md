### dynamic-comp

In this directory, the list of elements missed in the from the traces and annotations are located and scripts used to compute missed annotation rate.

### scripts/tools

In this directly all the jars required to checkers (CFNullness, NullAway) and compile all benchmarks are located.
All scripts used to run checkers or compile projects uses jars in this directory.

### scripts/nullness
In this directory the output from compilation for each project is located

### scripts/nullness

In this directory the output from running nullness checker is located for on the each inference tool output.

### scripts/nullaway

In this directory the output from running nullaway checker is located for on the each inference tool output.

### scripts/run_annot_serializer

This scripts is an error-prone checker that scans a benchmark once plugged into javac and serializes the location all existing nullable annotations.

### scripts/run_nullaway

This script runs nullaway on all benchmarks on all inference output and saves the output of nullaway on nullaway/{$tool} directory.

### scripts/run_checkerframework.py

This script runs nullness checker on all benchmarks on all inference output and saves the output of nullness checker on nullaway/{$tool} directory.


### java_11_incompatible.txt
Containts list of java 11 incompatible benchmarks in NJR

### {$tool}_incomaptible.txt
Containts list of {$tool} incompatible benchmarks in NJR
