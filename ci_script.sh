#!/bin/bash

# Exit on any error
set -e

# Variables
VENV_DIR="venv"
REQUIREMENTS_FILE="requirements.txt"
PYTHON_CMD="python3"

# Create and activate virtual environment
echo "Creating virtual environment..."
$PYTHON_CMD -m venv $VENV_DIR

echo "Activating virtual environment..."
source $VENV_DIR/bin/activate

# Install dependencies
if [ -f "$REQUIREMENTS_FILE" ]; then
    echo "Installing dependencies..."
    pip install -r $REQUIREMENTS_FILE
else
    echo "$REQUIREMENTS_FILE not found!"
    exit 1
fi

# Run tests
echo "Running tests..."
pytest tests/

# Build project
echo "Building project..."
$PYTHON_CMD -m build

echo "Script completed successfully!"
