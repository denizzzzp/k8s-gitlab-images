FROM amd64/debian:9-slim
LABEL maintainer "Denys Spasiuk <denizzzzp@gmail.com"

ENV KUBECTL_VERSION=1.18.0

RUN apt update -y && apt upgrade && apt install curl -y && echo "k8s" | base64
RUN curl -L https://storage.googleapis.com/kubernetes-release/release/v$KUBECTL_VERSION/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl && chmod +x /usr/local/bin/kubectl && mkdir -p /root/.kube

ENTRYPOINT [ "kubectl" ]
CMD [ "--help" ]
