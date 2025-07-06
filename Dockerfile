FROM alpine:3.14

# Install dependencies
RUN apk add --no-cache curl python3 py3-pip

# Install AWS CLI using pip instead of binary for better architecture compatibility
RUN pip3 install awscli && \
    aws --version

# Install kubectl
RUN curl -sLO "https://dl.k8s.io/release/$(curl -sL https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
    chmod +x kubectl && \
    mv kubectl /usr/local/bin/ && \
    kubectl version --client

WORKDIR /app
