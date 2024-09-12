import os
import shutil
import re

# Set the paths
source_dir = '.'  
destination_dir = '../wpifinal' 

# Create the destination directory if it does not exist
if not os.path.exists(destination_dir):
    os.makedirs(destination_dir)

def extract_iteration_number(iteration_name):
    match = re.search(r'\d+', iteration_name)
    return int(match.group()) if match else -1

# Iterate over each benchmark directory
for benchmark in os.listdir(source_dir):
    benchmark_path = os.path.join(source_dir, benchmark)
    if os.path.isdir(benchmark_path):
        wpi_iterations_path = os.path.join(benchmark_path, 'wpi-iterations')
        if os.path.exists(wpi_iterations_path) and os.path.isdir(wpi_iterations_path):
            iterations = sorted(os.listdir(wpi_iterations_path), key=extract_iteration_number)
            if iterations:
                last_iteration = iterations[-1]
                last_iteration_path = os.path.join(wpi_iterations_path, last_iteration)
                
                destination_benchmark_path = os.path.join(destination_dir, benchmark, 'src')
                if not os.path.exists(destination_benchmark_path):
                    os.makedirs(destination_benchmark_path)
                
                # Copy contents of the last iteration to the destination/src
                for item in os.listdir(last_iteration_path):
                    source_item = os.path.join(last_iteration_path, item)
                    destination_item = os.path.join(destination_benchmark_path, item)
                    if os.path.isdir(source_item):
                        shutil.copytree(source_item, destination_item)
                    else:
                        shutil.copy2(source_item, destination_item)

print("Completed copying last iterations to the new general folder.")

