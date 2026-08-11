#!/bin/bash
# Clone source code directly into subdirectories
git clone --recursive https://github.com/26F-Studio/Studio26F.git studio26f_src
git clone https://github.com/26F-Studio/Techrater.git techrater_src

# Move source files into respective folders without overwriting Dockerfile/config.json
cp -rn studio26f_src/* studio26f_src/.* studio26f/ 2>/dev/null || true
cp -rn techrater_src/* techrater_src/.* techrater/ 2>/dev/null || true

# Clean up temporary clones
rm -rf studio26f_src techrater_src

