#!/bin/bash -e

declare -a versions=(
  "3.11.11"
)

curl -fsSL https://pyenv.run | bash

echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo '[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(pyenv init - bash)"' >> ~/.bashrc

for version in "${versions[@]}"; do
  $HOME/.pyenv/bin/pyenv install ${version}
done  

# for fish shell
fish -c 'set -Ux PYENV_ROOT $HOME/.pyenv'
fish -c 'fish_add_path $PYENV_ROOT/bin'
echo 'pyenv init - fish | source' >> ~/.config/fish/config.fish

# Install poetry
curl -sSL https://install.python-poetry.org | python3 -

# Install uv
curl -LsSf https://astral.sh/uv/install.sh | sh
