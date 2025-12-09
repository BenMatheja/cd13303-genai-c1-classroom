#!/usr/bin/env bash

# GenAI C1 Project Setup Script
# This script performs all installation steps for the project

set -e  # Exit on any error

echo "======================================"
echo "GenAI C1 Project Setup"
echo "======================================"
echo ""

# Check if we're in the right directory
if [ ! -f "requirements.txt" ]; then
    echo "Error: requirements.txt not found. Please run this script from the project directory."
    exit 1
fi

# Step 1: Install uv if not already installed
echo "[1/4] Checking for uv installation..."
if ! command -v uv &> /dev/null; then
    echo "Installing uv..."
    curl -LsSf https://astral.sh/uv/install.sh | sh
    echo ""
    echo "⚠️  uv has been installed. Please restart your terminal and run this script again."
    echo ""
    exit 0
else
    echo "✓ uv is already installed"
fi

# Step 2: Pin Python version
echo ""
echo "[2/4] Pinning Python version to 3.12.3..."
uv python pin 3.12.3
echo "✓ Python version pinned"

# Step 3: Initialize and sync environment
echo ""
echo "[3/4] Initializing environment..."
uv init
echo "✓ Environment initialized"

echo "Syncing environment..."
uv sync
echo "✓ Environment synced"

# Step 4: Install dependencies
echo ""
echo "[4/4] Installing dependencies..."
echo "Adding ipykernel and pip..."
uv add ipykernel pip
echo "✓ ipykernel and pip added"

echo "Installing project requirements..."
uv pip install -r requirements.txt --no-deps
echo "✓ Project requirements installed"

# Final message
echo ""
echo "======================================"
echo "✓ Setup Complete!"
echo "======================================"
echo ""
echo "Next steps:"
echo "1. Open project/starter/gen_ai_fundamentals_project_starter.ipynb in Jupyter"
echo "2. Select the .venv kernel"
echo "3. Execute cells in order"
echo ""
echo "Note: If you need NVIDIA drivers and CUDA, refer to the README.md for installation instructions."
echo ""
