#! /usr/bin/env bash

EXE="$1"
DIR="$2"

cd "$DIR"
mkdir -p _output

for file in input/*.txt; do
  filename="$(basename "$file" .txt)"
  output="$(echo "$filename" | sed 's/input/output/').txt"

  printf "Running input %s\n" "$filename"

  export OUTPUT_PATH="_output/$filename.txt"
  cat "$file" | $EXE &> "_output/$filename.txt"
  diff --side-by-side --ignore-trailing-space "output/$output" "_output/$filename.txt" || exit 1
done
