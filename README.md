# Decompressor

Decompressor is a Bash script designed to handle nested compressed files automatically. Given an initial compressed file (`data.gz` by default), the script decompresses it and continues extracting any subsequent compressed files generated in the process until no further compressed files remain. This is especially useful for dealing with multi-layered archives.

## Features

- **Recursive Extraction**: Automatically decompresses nested files, handling multiple layers of compressed content.
- **Signal Handling**: Captures `Ctrl+C` to exit gracefully, displaying a custom exit message.
- **Customizable Start File**: The initial file to decompress can be modified by changing the `first_file_name` variable in the script.

## Requirements

- `7z` (p7zip) must be installed for this script to work, as it relies on this command-line tool for decompression.

## Usage

To use Decompressor, simply execute the script. By default, it looks for a file named `data.gz` in the same directory. You can modify this file name by changing the `first_file_name` variable within the script.

```bash
./decompressor.sh
```

## Example Output

```
[+] New decompressed file: file1.gz
[+] New decompressed file: file2.gz
[+] New decompressed file: file3.txt
...
```

## How it works

- **Initial Extraction**: The script begins by decompressing the specified `first_file_name` (default: `data.gz`).
- **Nested File Detection**: After each decompression, the script checks for additional compressed files within the newly decompressed content.
- **Recursive Loop**: This process repeats until no further compressed files are detected, effectively “unwrapping” layers of compressed files.
- **Signal Handling**: If `Ctrl+C` is pressed, the `ctrl_c` function is triggered, which exits the script and displays an exit message.

## Notes

- Warning: Only run this script on files you trust, as extracting unknown files may pose security risks.
- To customize the initial file, modify the `first_file_name` variable in the script.
