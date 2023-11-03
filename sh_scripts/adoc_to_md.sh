#!/bin/bash

clear

if [ $# -eq 0 ]; then
    echo "No adoc Document provided. Aborting."
    exit 1
fi

found_files=$(find . -type f -name "$1*" 2>/dev/null)

found_file=$(echo "$found_files" | head -n 1)

file_name=${found_file:2}
base_name="${file_name%.*}"

if [ -n "$found_file" ]; then

    doc_adoc="$base_name.adoc"
    doc_xml="$base_name.xml"
    doc_md="$base_name.md"

    echo -e "Will convert $doc_adoc to $doc_md \n"

    asciidoctor -b docbook $doc_adoc

    pandoc -f docbook -t markdown_strict $doc_xml -o $doc_md

    rm $doc_xml

else
    echo "adoc File '$1' not found."
fi
