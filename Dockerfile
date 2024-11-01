# You can find the new timestamped tags here: https://hub.docker.com/r/gitpod/workspace-full/tags
FROM gitpod/workspace-full:latest

SHELL [ "/bin/bash", "-c" ]

WORKDIR /var/tmp/

COPY installer/* .

# Install nodejs
RUN ./installer-node.sh

# Install terraform
RUN ./installer-terraform.sh

# Install python
RUN ./installer-python.sh

# Install other softwares
RUN ./installer-utilities.sh

# Envs
ENV GOOGLE_APPLICATION_CREDENTIALS /workspace/.gcp/default.json
ENV AWS_CONFIG_FILE /workspace/.aws/config
ENV AWS_SHARED_CREDENTIALS_FILE /workspace/.aws/credentials
