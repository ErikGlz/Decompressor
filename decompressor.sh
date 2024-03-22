#!/bin/bash

function ctrl_c(){
  echo -e "\n\n[!] Exiting...\n"
  exit 1 #Force exit with a "Not successful" status code
}

# Ctrl+C
trap ctrl_c INT #Captures Ctrl + C and redirects the flow of the program to ctrl_c()

first_file_name="data.gz" #Name of the first file that exists before starting the decompressions
decompressed_file_name="$(7z l data.gz | tail -n 3 | head -n 1 | awk 'NF{print $NF}')" #From all the information shown by the command, it filters only the name of the file resulting from the decompression

7z x $first_file_name &>/dev/null #Extracts the content of the decompressed file and redirects stdout to /dev/null

#While decompressed_file_name has content, the previous process is repeated
while [ $decompressed_file_name ]; do 
  echo -e "\n[+] New decompressed file: $decompressed_file_name"
  7z x $decompressed_file_name &>/dev/null
  decompressed_file_name="$(7z l $decompressed_file_name 2>/dev/null | tail -n 3 | head -n 1 | awk 'NF{print $NF}')"
done
