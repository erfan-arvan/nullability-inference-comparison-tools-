import os
import re

def remove_comments_from_file(file_path):
    with open(file_path, 'r') as file:
        code = file.read()

    # Remove single-line comments
    code = re.sub(r'//.*', '', code)

    # Remove multi-line comments
    code = re.sub(r'/\*[\s\S]*?\*/', '', code)

    with open(file_path, 'w') as file:
        file.write(code)

def remove_comments_in_dir(directory):
    for root, _, files in os.walk(directory):
        for file in files:
            if file.endswith('.java'):
                file_path = os.path.join(root, file)
                print(f"Processing {file_path}")
                remove_comments_from_file(file_path)

# Start from the current directory
current_dir = os.getcwd()
remove_comments_in_dir(current_dir)
