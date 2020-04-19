#!/bin/bash

temp_file=$(mktemp)
echo "Date,Description,Category,Cost,Currency,Alex Palcuie,Ada Solcan" > "$temp_file"
tail -n 50 "$1" | head -n 48 >> "$temp_file"

name=$(basename "$1" .csv)

csv2ofx -x /Users/palcu/Projects/splitwise-to-ofx/mapping.py "$temp_file" "$name.ofx"
