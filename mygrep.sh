#!/bin/bash
# Show help if --help is passed
if [[ $1 == "--help" ]]; then
  echo "Usage: $0 [-n] [-v] <search_string> <filename>"
  echo
  echo "Options:"
  echo "  -n   Show line numbers"
  echo "  -v   Invert match (show lines that do not match)"
  echo "  --help  Show this help message"
  exit 0
fi


# Show usage info
show_usage() {
  echo "Usage: $0 [-n] [-v] <search_string> <filename>"
  echo "Options:"
  echo "  -n   Show line numbers"
  echo "  -v   Invert match (show lines that do not match)"
  exit 1
}

# Initialize option flags
show_line_numbers=false
invert_match=false

# Parse options
while getopts "nv" opt; do
  case $opt in
    n) show_line_numbers=true ;;
    v) invert_match=true ;;
    *) show_usage ;;
  esac
done

# Shift processed options away
shift $((OPTIND-1))

# Check for required arguments
if [[ $# -ne 2 ]]; then
  show_usage
fi

search_string=$1
filename=$2

# Check if file exists
if [[ ! -f $filename ]]; then
  echo "Error: File '$filename' not found."
  exit 1
fi

# Build grep options
grep_options="-i"
if $show_line_numbers; then
  grep_options="$grep_options -n"
fi
if $invert_match; then
  grep_options="$grep_options -v"
fi

# Perform search
grep $grep_options -- "$search_string" "$filename"

