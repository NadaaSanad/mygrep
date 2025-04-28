# mygrep

A custom implementation of the `grep` command in Bash that supports basic search functionality and several command-line options.

## Features
- Case-insensitive search for a string in a text file.
- Supports the `-n` option to show line numbers.
- Supports the `-v` option to invert matches.
- Supports combined options, like `-vn` and `-nv`.
- Includes a `--help` option for usage details.

## Usage

To search for a string in a file:

```bash
./mygrep.sh <search_string> <filename>
