ARG AZURE_CLI_TAG="latest"
FROM microsoft/azure-cli:${AZURE_CLI_TAG}

ARG TERRAFORM_VERSION="0.12.24"
ARG TERRAFORM_DOCS_VERSION="v0.9.1"

RUN apk --update  add python bash ca-certificates git openssl unzip wget vim jq zsh docker

# Install kubectl
RUN az aks install-cli

# Install terraform
RUN cd /tmp && \
    wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/bin

# Install terraform docs
RUN wget https://github.com/segmentio/terraform-docs/releases/download/${TERRAFORM_DOCS_VERSION}/terraform-docs-${TERRAFORM_DOCS_VERSION}-linux-amd64 && \
    mv ./terraform-docs-${TERRAFORM_DOCS_VERSION}-linux-amd64 /usr/bin/terraform-docs &&\
    chmod +x /usr/bin/terraform-docs

# Install Go for terratest
RUN apk add --no-cache --virtual .build-deps gcc musl-dev go
    
ENV GOROOT /usr/lib/go
ENV GOPATH /go
ENV PATH /go/bin:$PATH

# Best practice to run the container as a user instead of root
RUN addgroup -g 1000 clz && \
    adduser -D -u 1000 -G clz clz
RUN mkdir /go && chown -R 1000:1000 /go


USER clz
RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true



VOLUME /sources
WORKDIR /sources

ENTRYPOINT ["zsh"]