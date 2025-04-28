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
Reflective Section
📌 How the Script Handles Arguments and Options:

    The script uses positional parameters ($1, $2, etc.) to capture command-line input.

    It checks if the first argument is an option (-n, -v, or combined like -vn), or a search string.

    Through a case statement or if-else blocks, it handles:

        -n → Show line numbers

        -v → Invert match

        Combinations like -vn or -nv

    It validates that at least two valid arguments (search term and file) are provided.
    If not, it displays a usage message and exits.

    If the user runs it with --help, it prints a usage guide.

📌 If I Were to Support -i, -c, -l, or Regex:

    I would refactor the script to use getopts for cleaner, scalable option parsing.

    -i (case-insensitive) → Add -i flag to the grep logic.

    -c (count matches) → Use grep -c or count lines in a loop.

    -l (list files with matches) → Use grep -l.

    Support for regex → Allow the search term to be treated as a regular expression directly passed to grep or awk.

📌 Hardest Part to Implement:

    Handling combined options like -vn and -nv cleanly.

    Ensuring the order of operations (invert first, then show line numbers, or vice versa) was consistent.

    Making sure error handling worked as expected and the help message displayed properly for invalid or missing arguments.
