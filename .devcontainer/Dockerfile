ARG AZURE_CLI_TAG="latest"
FROM microsoft/azure-cli:${AZURE_CLI_TAG}

ARG TERRAFORM_VERSION="0.12.24"

RUN apk --update  add python bash ca-certificates git openssl unzip wget vim jq zsh docker

RUN az aks install-cli
RUN cd /tmp && \
    wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/bin


# Best practice to run the container as a user instead of root
RUN addgroup -g 1000 clz && \
    adduser -D -u 1000 -G clz clz

USER clz
RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true



VOLUME /sources
WORKDIR /sources

ENTRYPOINT ["zsh"]