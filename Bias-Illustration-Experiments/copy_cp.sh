# To normalize the project, assign the correct value to CLASSPATH variable and run this in the lib dir of your project to copy all of the build classpaths to lib dir

#!/bin/bash


CLASSPATH=""


# Define the target directory as the current directory
TARGET_DIR="."

# Split the classpath into an array
IFS=':' read -r -a paths <<< "$CLASSPATH"

# Create a temporary directory for extracting AAR files
TEMP_DIR=$(mktemp -d)

# Function to generate a unique name for JAR files
generate_unique_name() {
    base_name=$1
    extension="${base_name##*.}"
    name="${base_name%.*}"

    counter=1
    new_name="$name-$counter.$extension"
    
    while [ -e "$TARGET_DIR/$new_name" ]; do
        counter=$((counter + 1))
        new_name="$name-$counter.$extension"
    done

    echo "$new_name"
}

# Function to extract JAR files from AAR files and copy them to the target directory
extract_jar_from_aar() {
    aar_file=$1
    aar_name=$(basename "$aar_file" .aar)
    dest_dir="$TARGET_DIR"

    unzip -o "$aar_file" -d "$TEMP_DIR" > /dev/null
    
    if [ -f "$TEMP_DIR/classes.jar" ]; then
        jar_name=$(generate_unique_name "$aar_name.jar")
        echo "Copying classes.jar from $aar_file to $dest_dir/$jar_name"
        mv "$TEMP_DIR/classes.jar" "$dest_dir/$jar_name"
    else
        echo "classes.jar not found in $aar_file"
    fi
    
    if [ -d "$TEMP_DIR/libs" ]; then
        for jar in "$TEMP_DIR/libs/"*.jar; do
            if [ -f "$jar" ]; then
                jar_name=$(basename "$jar")
                unique_jar_name=$(generate_unique_name "$aar_name-$jar_name")
                echo "Copying $jar from $aar_file to $dest_dir/$unique_jar_name"
                mv "$jar" "$dest_dir/$unique_jar_name"
            else
                echo "No JAR files found in libs directory of $aar_file"
            fi
        done
    else
        echo "libs directory not found in $aar_file"
    fi
    
    # Clean up the temporary directory after processing each AAR
    rm -rf "$TEMP_DIR"/*
}

# Copy each item in the classpath to the target directory
for path in "${paths[@]}"; do
    if [[ "$path" == *.aar ]]; then
        echo "Extracting JAR from $path"
        extract_jar_from_aar "$path"
    elif [[ "$path" == *.jar ]]; then
        jar_name=$(basename "$path")
        unique_jar_name=$(generate_unique_name "$jar_name")
        echo "Copying JAR from $path to $TARGET_DIR as $unique_jar_name"
        cp -rf "$path" "$TARGET_DIR/$unique_jar_name"
    fi
done

# Clean up the temporary directory
rm -rf "$TEMP_DIR"

echo "Classpath files have been copied to $TARGET_DIR"