#!/bin/bash

echo "Compiling all programs"
make all
echo "Compiled all programs"

echo "Creating A file"
./test_file_creator
echo "File A created"

echo "Creating file B from A"
./sparse_file A B
echo "File B created"

echo "Gzipping A and B files"
gzip -k A
gzip -k B
echo "Gzipped A and B"

echo "Unzip B to file C"
gzip -cd B.gz | ./sparse_file C
echo "Unziped B to file C"

echo "Copying file A to D with 100 block size"
./sparse_file A D -b 100
echo "Copied file A to D with 100 block size"

result=$(stat -c "%n = %s" A A.gz B B.gz C D)
echo "$result" > results.txt
echo "$result"
