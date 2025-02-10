#!/bin/bash

apt-get update && \
  apt-get install -y libbz2-dev liblzma-dev libncurses5-dev libreadline-dev sqlite3 libsqlite3-dev libffi-dev \
  git-flow fish shellcheck python3-pip \
  apt-transport-https ca-certificates gnupg curl software-properties-common && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*
