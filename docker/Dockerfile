FROM ubuntu:22.04

### Install the following dependenices in the docker image
# 
# curl iproute2 sshfs unzip less groff 
# Install kubectl from https://dl.k8s.io/release/v1.23.6/bin/linux/amd64/kubectl
#
# Install AWS CLI from https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip
# 
# Install the above tools, unpack and make it available in the PATH executable
###

RUN apt-get update && apt-get install -y \
    curl \
    iproute2 \
    sshfs \
    unzip \
    less \
    groff \
    && rm -rf /var/lib/apt/lists/*

# Install kubectl
RUN curl -LO https://dl.k8s.io/release/v1.23.6/bin/linux/amd64/kubectl
RUN chmod +x kubectl
RUN mv ./kubectl /usr/local/bin

# Install AWS CLI
RUN curl https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip -o /tmp/awscliv2.zip \
    && unzip -q /tmp/awscliv2.zip -d /opt \
    && /opt/aws/install --update -i /usr/local/aws-cli -b /usr/local/bin \
    && rm /tmp/awscliv2.zip \
    && rm -rf /opt/aws \
    && aws --version

ENTRYPOINT ["tail", "-f", "dev/null"]
