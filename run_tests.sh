#!/bin/bash

# Activate our virtual environment
source venv/bin/activate

# Check Python coding style with flake8, using black's default max line length
# To auto-format a file, you can run `python -m black filename.py`
echo "Running flake8..."
python -m flake8 --max-line-length=88 --exclude=venv

# Find all .py files (ignoring venv) and check their code style with pylint,
# using (something close to) Google's default config
echo "Running pylint..."
find . -type f -name "*.py" ! -path "./venv/*" | xargs \
    pylint --rcfile=tests/pylintrc

# Run our unit tests with code coverage
echo "Running unit tests..."
python -m coverage run --omit="venv/*","tests/*" -m unittest discover tests/

# Show the lines our tests miss
python -m coverage report --show-missing

# [optional] Check Markdown coding style with Ruby's markdown lint
# https://github.com/markdownlint/markdownlint
echo "Running markdown lint..."
mdl --git-recurse --style tests/mdl_style.rb ./
