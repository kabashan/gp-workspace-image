# You can find the new timestamped tags here: https://hub.docker.com/r/gitpod/workspace-full/tags
FROM gitpod/workspace-full:latest

SHELL [ "/bin/bash", "-c" ]

# Install nodejs
# (See this https://github.com/nvm-sh/nvm?tab=readme-ov-file#usage)
RUN . $HOME/.nvm/nvm.sh && \
    nvm install 18.12.1 && \
    nvm alias default 18.12.1 && \
    nvm use default && \
    npm install yarn -g && \
    nvm uninstall 20

# Install terraform
# (See this https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
RUN sudo apt-get update && sudo apt-get install -y gnupg software-properties-common && \
    wget -O- https://apt.releases.hashicorp.com/gpg | \
    gpg --dearmor | \
    sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null && \
    echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
    https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
    sudo tee /etc/apt/sources.list.d/hashicorp.list && \
    sudo apt update && sudo apt-get install terraform=1.8.4-1

# Install cloud sdk
# (See this https://cloud.google.com/sdk/docs/install?hl=ja)
RUN curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-476.0.0-linux-x86_64.tar.gz && \
    tar -xf google-cloud-cli-476.0.0-linux-x86_64.tar.gz && rm google-cloud-cli-476.0.0-linux-x86_64.tar.gz && \
    ./google-cloud-sdk/install.sh -q --path-update true

# Install other tools
RUN sudo apt-get install -y git-flow

# Install github client
RUN (type -p wget >/dev/null || (sudo apt update && sudo apt-get install wget -y)) \
  && sudo mkdir -p -m 755 /etc/apt/keyrings \
  && wget -qO- https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
  && sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
  && echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
  && sudo apt update \
  && sudo apt install gh -y

# Install AWS client
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
  && unzip -q awscliv2.zip \
  && sudo ./aws/install \
  && rm -r aws awscliv2.zip

# Envs
ENV GOOGLE_APPLICATION_CREDENTIALS /workspace/.gcp/default.json
