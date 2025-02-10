#!/bin/bash


declare -a versions=(
  "16"
  "18"
  "22"
)

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
. $HOME/.nvm/nvm.sh

for version in "${versions[@]}"; do
  nvm install ${version} && npm install yarn -g
done  


fish -c 'curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher'
fish -c 'fisher install jorgebucaran/nvm.fish'

fish -c 'nvm install 22 --lts && npm install -g yarn'
fish -c 'nvm install 18 --lts && npm install -g yarn'
fish -c 'nvm install 16 --lts && npm install -g yarn'
