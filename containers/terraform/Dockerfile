FROM alpine

RUN apk update

RUN wget https://releases.hashicorp.com/terraform/1.3.9/terraform_1.3.9_linux_amd64.zip
RUN unzip terraform_1.3.9_linux_amd64.zip
RUN mv terraform /usr/bin/terraform


RUN apk add py3-pip gcc musl-dev python3-dev libffi-dev openssl-dev cargo make
RUN pip install --upgrade pip
RUN pip install awscli
