#!/bin/bash

apt-get update
apt-get install -y \
  libbz2-dev \
  liblzma-dev \
  libncurses5-dev \
  libreadline-dev \
  sqlite3 \
  libsqlite3-dev \
  libffi-dev \
  git-flow \
  shellcheck \
  apt-transport-https \
  ca-certificates \
  gnupg \
  curl \
  software-properties-common \
  python3-pip

apt-get clean
rm -rf /var/lib/apt/lists/*

sudo apt-add-repository -y ppa:fish-shell/release-3
sudo apt update
sudo apt install -y fish