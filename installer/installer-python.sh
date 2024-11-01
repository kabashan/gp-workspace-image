#!/bin/bash

declare -a versions=(
  "3.11.3"
)

for version in "${versions[@]}"; do
  pyenv install ${version}
done  

