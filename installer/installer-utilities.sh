#!/bin/bash

# Install
sudo apt-get update && sudo apt-get install -y git-flow fish shellcheck

# Install cloud sdk for google cloud
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates gnupg curl
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
sudo apt-get update && sudo apt-get install -y google-cloud-cli


# Install github client
(type -p wget >/dev/null || (sudo apt update && sudo apt-get install wget -y)) \
&& sudo mkdir -p -m 755 /etc/apt/keyrings \
&& wget -qO- https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
&& sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
&& sudo apt update \
&& sudo apt install gh -y


# Install AWS client
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip -q awscliv2.zip
sudo ./aws/install
rm -r aws awscliv2.zip

# Install slack
curl -fsSL https://downloads.slack-edge.com/slack-cli/install.sh | bash
export PATH=$HOME/.slack/bin/:$PATH

# Install snowsql
curl -LO https://sfc-repo.azure.snowflakecomputing.com/snowsql/bootstrap/1.2/linux_x86_64/snowsql-1.2.32-linux_x86_64.bash
SNOWSQL_DEST=$HOME/bin SNOWSQL_LOGIN_SHELL=$HOME/.profile bash snowsql-1.2.32-linux_x86_64.bash
rm snowsql-1.2.32-linux_x86_64.bash

# Install snow client
wget https://sfc-repo.snowflakecomputing.com/snowflake-cli/linux_x86_64/3.1.0/snowflake-cli-3.1.0.x86_64.deb
sudo dpkg -i snowflake-cli-3.1.0.x86_64.deb
rm snowflake-cli-3.1.0.x86_64.deb
