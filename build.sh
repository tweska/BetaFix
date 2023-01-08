#!/bin/bash

# Enable double asterisk (**) in bash
shopt -s globstar

# Download RetroMCP
wget https://github.com/MCPHackers/RetroMCP-Java/releases/download/v1.0-pre3/RetroMCP-Java-all.jar -O RetroMCP.jar

# Initialize RetroMCP
java -jar RetroMCP.jar cleanup
java -jar RetroMCP.jar setup b1.7.3
java -jar RetroMCP.jar decompile client

# Apply the patches
git apply --verbose --directory=src/minecraft patches/patches_client/**/*.patch

# Build the minecraft zip
java -jar RetroMCP.jar build client

# Copy the zip to the project root
cp build/minecraft.zip BetaFix.zip
