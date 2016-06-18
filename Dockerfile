FROM quay.io/webcenter/rancher-base-image:latest
MAINTAINER Sebastien LANGOUREAUX (linuxworkgroup@hotmail.com)


# Install go.cd server
RUN echo "deb https://download.go.cd /" | sudo tee /etc/apt/sources.list.d/gocd.list &&\
    curl https://download.go.cd/GOCD-GPG-KEY.asc | sudo apt-key add - &&\
    apt-get update &&\
    apt-get install -y go-server apache2-utils

ENV MANUAL_SETTING Y
ENV GO_SERVER_PORT 8153
ENV GO_SERVER_SSL_PORT 8154
ENV SERVER_WORK_DIR /var/lib/go-server/workdir

# We create folder fo go-cd server
RUN rm -rf /etc/go
RUN mkdir -p /var/lib/go-server/workdir
RUN cp -a /usr/share/go-server /var/lib/go-server
RUN chown -R /var/lib/go-server

COPY assets/init.py /app/init.py
