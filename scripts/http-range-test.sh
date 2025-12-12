#!/bin/bash

# Check if required arguments are provided
if [ "$#" -ne 4 ] || [ "$1" != "--url" ] || [ "$3" != "--range" ]; then
    echo "Usage: $0 --url <Download URL> --range <Byte Range>"
    echo "Example: $0 --url https://example.com/file.zip --range 0-1023"
    exit 1
fi

# Assign arguments to variables
URL="$2"
RANGE="$4"
OUTPUT_FILE="download_test_part.bin"

echo "Download URL: $URL"
echo "Requested Byte Range: $RANGE"
echo "Output File: $OUTPUT_FILE"

echo "---"

# Use curl to download only the specified byte range
# -r or --range: Specify the byte range
# -o or --output: Specify the output file name
# -s or --silent: Do not show the progress bar
# -S or --show-error: Show error message if an error occurs
echo "Starting download..."
curl -sS -r "$RANGE" -o "$OUTPUT_FILE" "$URL"
CURL_STATUS=$? # Save the exit status of the curl command

# Check the download result
if [ $CURL_STATUS -eq 0 ]; then
    echo "Download successful!"
    DOWNLOADED_SIZE=$(wc -c < "$OUTPUT_FILE")
    echo "Downloaded file size: $DOWNLOADED_SIZE bytes"
    
    # Simple check of file size to verify if the Range request was successfully processed (not a full validation)
    # The range 0-1023 should be 1024 bytes.
    if [[ "$RANGE" =~ ([0-9]+)-([0-9]+) ]]; then
        START=${BASH_REMATCH[1]}
        END=${BASH_REMATCH[2]}
        EXPECTED_SIZE=$((END - START + 1))
        
        if [ "$DOWNLOADED_SIZE" -eq "$EXPECTED_SIZE" ]; then
            echo "The requested range ($RANGE) and downloaded size ($DOWNLOADED_SIZE) match."
        else
            echo "Warning: The requested range and downloaded size may not match. (Expected size: $EXPECTED_SIZE bytes)"
            echo "This could be because the server does not support partial downloads or for other reasons."
        fi
    fi
    
    # Remove the downloaded temporary file (Optional)
    # rm "$OUTPUT_FILE"
    # echo "Temporary file $OUTPUT_FILE removed."
else
    echo "Download failed! (curl exit code: $CURL_STATUS)"
    echo "This may mean the server does not support partial content requests (HTTP Range), the URL is incorrect, or there was another network error."
fi
