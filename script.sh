#!/bin/bash

# Exit if any command fails
# https://www.gnu.org/software/bash/manual/html_node/The-Set-Builtin.html
set -o errexit

# Activate our virtual environment
source venv/bin/activate

# Call our Python script, passing a command line argument
python -m hello --n_times=3
