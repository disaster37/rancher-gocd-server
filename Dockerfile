FROM quay.io/webcenter/rancher-base-image:latest
MAINTAINER Sebastien LANGOUREAUX (linuxworkgroup@hotmail.com)



RUN apt-get update &&\
    apt-get install -y apt-transport-https

# Install go.cd server
RUN echo "deb https://download.go.cd /" | sudo tee /etc/apt/sources.list.d/gocd.list &&\
    curl https://download.go.cd/GOCD-GPG-KEY.asc | sudo apt-key add - &&\
    apt-get update &&\
    apt-get install -y go-server apache2-utils openjdk-8-jre-headless

# CLEAN APT
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Fix some settings
ENV MANUAL_SETTING Y
ENV GO_SERVER_PORT 8153
ENV GO_SERVER_SSL_PORT 8154
ENV SERVER_WORK_DIR /var/lib/go-server/workdir

# We create folder fo go-cd server
RUN rm -rf /etc/go
RUN mkdir -p /var/lib/go-server/workdir
RUN cp -a /usr/share/go-server /var/lib/go-server
RUN chown -R go:go /var/lib/go-server

# Download some usefull plugins
COPY assets/install-plugin.sh /app/
RUN chmod +x /app/install-plugin.sh
RUN /app/install-plugin.sh

COPY assets/init.py /app/init.py
COPY assets/run.sh /app/run.sh
RUN chmod +x /app/run.sh

EXPOSE 8153
EXPOSE 8154
VOLUME /var/lib/go-server

CMD /app/run.sh
