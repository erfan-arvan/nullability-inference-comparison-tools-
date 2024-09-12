#Creates pre- and post branches of benchmarks for WPI

#!/bin/bash

# Define the path to the CSV file
CSV_FILE="commits_unix.csv"

# Read the CSV file line by line, skipping the header
tail -n +2 "$CSV_FILE" | while IFS=, read -r ProjectName Link pre_wpi_with_s pre_wpi_without_s post_wpi_with_s post_wpi_without_s _; do
  # Trim any leading or trailing whitespace from the variables
  ProjectName=$(echo $ProjectName | xargs)
  Link=$(echo $Link | xargs)
  pre_wpi_with_s=$(echo $pre_wpi_with_s | xargs | sed 's/,$//')
  pre_wpi_without_s=$(echo $pre_wpi_without_s | xargs | sed 's/,$//')
  post_wpi_with_s=$(echo $post_wpi_with_s | xargs | sed 's/,$//')
  post_wpi_without_s=$(echo $post_wpi_without_s | xargs | sed 's/,$//')

  # Skip empty rows
  if [[ -z "$ProjectName" || -z "$Link" ]]; then
    continue
  fi

  echo "----------------------------------------"
  echo "Processing project: $ProjectName"
  echo "Repository link: $Link"
  echo "pre_wpi_with_s commit hash: $pre_wpi_with_s"
  echo "pre_wpi_without_s commit hash: $pre_wpi_without_s"
  echo "post_wpi_with_s commit hash: $post_wpi_with_s"
  echo "post_wpi_without_s commit hash: $post_wpi_without_s"
  echo "----------------------------------------"

  # Define the project directory path
  project_dir="projects/$ProjectName"

  # Check if the project directory already exists
  if [[ -d $project_dir ]]; then
    echo "Skipping project $ProjectName as the directory $project_dir already exists."
    continue
  fi

  echo "Creating directory: $project_dir"
  # Create a directory for the project
  mkdir -p "$project_dir"
  
  # Change to the project directory
  echo "Changing to directory: $project_dir"
  cd "$project_dir" || exit
  
  # Clone the repository for each commit hash and checkout to the specific branch
  for column in "pre_wpi_with_s" "pre_wpi_without_s" "post_wpi_with_s" "post_wpi_without_s"; do
    commit_hash=$(eval echo \$$column)
    if [[ -n $commit_hash && $commit_hash != *","* ]]; then
      echo "Cloning repository: $Link"
      echo "With commit hash: $commit_hash"
      echo "For column: $column"
      # Clone the repository with a specific directory name
      repo_dir="${column}_${ProjectName}"
      echo "Repository directory: $repo_dir"
      git clone "$Link" "$repo_dir"
      cd "$repo_dir" || exit
      echo "Checking out branch: $column"
      git checkout -b "$column" "$commit_hash"
      cd ..
    else
      echo "Skipping invalid commit hash for $column in project $ProjectName"
    fi
  done
  
  # Return to the original directory
  echo "Returning to original directory"
  cd ../../
done
