#! /usr/bin/env bash

EXE="$1"
DIR="$2"

cd "$DIR"
mkdir -p _output

for file in input/*.txt; do
  filename="$(basename "$file" .txt)"
  output="$(echo "$filename" | sed 's/input/output/').txt"

  cat "$file" | $EXE &> "_output/$filename.txt"
  diff -Z "output/$output" "_output/$filename.txt" || exit 1
done
