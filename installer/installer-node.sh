#!/bin/bash

declare -a versions=(
  "16.20.2"
  "18.20.4"
  "20.16.0"
)

. $HOME/.nvm/nvm.sh

for version in "${versions[@]}"; do
  nvm install ${version} && npm install yarn -g
done  
