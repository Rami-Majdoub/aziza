#!/bin/bash

folder="$1-weekend" # 45-25
base_url="https://int01.azizacdn.com/catalogues_pdf/weekend"
mkdir -p "$folder"

i=1
while true; do
    file="$folder/$i.jpg"
    url="$base_url/$i.jpg"

    echo "Downloading $url..."
    curl -sf -o "$file" "$url"
    if [ $? -ne 0 ]; then
        echo "No more images found (404). Stopping at image $((i-1))."
        rm -f "$file"
        break
    fi

    i=$((i+1))
done