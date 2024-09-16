#!/bin/bash

# This script decrypts all the PDFs in the current folder and saves them in the output directory

# Find all PDF files in the current directory
FILES=$(find . -maxdepth 1 -name "*.pdf")

# Define the output directory
OUTPUT="$HOME/Downloads/deleteme/output"

# Prompt the user for the password
echo -n "Enter password: "
read PASS

# Create the output directory if it doesn't exist
mkdir -p "$OUTPUT"

# Loop through each file
for file in $FILES; do

    # Extract just the filename from the full path
    filename=$(basename "$file")

    echo "Decrypting $filename..."

    # Perform the decryption with qpdf
    qpdf --password="$PASS" --decrypt "$file" "$OUTPUT/$filename"
done
