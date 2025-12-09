#!/bin/bash

folder="$1" # 45-25
base_url="https://clusterazprices.flesk.fr/catalogues_pdf/$folder/images"
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