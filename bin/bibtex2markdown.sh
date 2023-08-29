#!/usr/bin/env bash
: 'Convert a BibTeX entry to APA markdown'

bib_input_file="${1:-/dev/stdin/}"
cat "${bib_input_file}" > /tmp/temp.bib

echo "---
bibliography: /tmp/temp.bib
nocite: '@*'
..." > /tmp/temp.md

pandoc -t markdown_strict --csl ./numbers.csl --citeproc  /tmp/temp.md -o /dev/stdout