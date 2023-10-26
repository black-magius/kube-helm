FROM alpine/helm:3.2.1
LABEL org.opencontainers.image.source https://github.com/github/issue-metrics

RUN apk add --update coreutils gettext curl bash && \
    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && chmod +x ./kubectl && \
    mkdir -p $HOME/.kube

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]