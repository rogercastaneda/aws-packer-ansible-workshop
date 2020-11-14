FROM ubuntu

WORKDIR /app

ARG TZ
ARG TERRAFORM_INSTALL_VERSION
ARG PACKER_INSTALL_VERSION

ENV TZ $TZ
ENV TERRAFORM_INSTALL_VERSION $TERRAFORM_INSTALL_VERSION
ENV PACKER_INSTALL_VERSION $PACKER_INSTALL_VERSION 

RUN echo $TERRAFORM_INSTALL_VERSION
RUN apt update && apt upgrade -y && \
  ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && \
  apt install -y wget curl vim zip unzip nano awscli ansible

RUN wget https://releases.hashicorp.com/terraform/${TERRAFORM_INSTALL_VERSION}/terraform_${TERRAFORM_INSTALL_VERSION}_linux_amd64.zip && \
  wget https://releases.hashicorp.com/packer/${PACKER_INSTALL_VERSION}/packer_${PACKER_INSTALL_VERSION}_linux_amd64.zip

RUN unzip terraform_${TERRAFORM_INSTALL_VERSION}_linux_amd64.zip && \
  unzip packer_${PACKER_INSTALL_VERSION}_linux_amd64.zip && \
  mv terraform /usr/local/bin/ && \
  mv packer /usr/local/bin