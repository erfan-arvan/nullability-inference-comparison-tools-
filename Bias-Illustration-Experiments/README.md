# Project Files Overview

This repository contains several files used for Bias Illustration study:

- **bias-results.xlsx**: Contains all results related to Section 3 of the paper.
  
- **Pre-And-Post-Commits-Decisions.docx**: Includes logs of author decisions and communication regarding the selection of pre and post-check versions for the benchmarks.
  
- **commits_unix.csv**: Contains the selected commits used in the scripts.
  
- **removeAnnotations.py**: Script used to remove all annotations. It has a flag to remove `@SuppressWarnings` as well.
  
- **removeCommentsLinesImports.py**: Removes all comments, empty lines, and imports from Java files.
  
- **remove_comments.py**: Used to remove comments from Java files.
  
- **copy_cp.sh**: Gathers all necessary jar files to normalize some benchmarks for running CFNullness.
  
- **count_nullable_errors_for_maven_projects.sh**: Counts the number of warnings in pre and post-check versions of Maven-related benchmarks.
  
- **iteration_extractor.py**: Extracts the last iterations of WPI (Whole Program Inference).
  
- **nullgtnCreateProjects.sh**: Creates projects using the selected pre and post commits for running NullGTN.
  
- **wpicreateProjects.sh**: Similar to the previous script, but for creating projects for WPI.
  
- **process_subdirs.sh**: Runs CFNullness on the post-check versions of WPI results.

Note: The scripts for running the inference tools and checkers are the same as those provided in the ../NJR-Experiments.
