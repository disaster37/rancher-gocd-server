#!/bin/bash
mkdir -p /var/lib/gocd/workdir/plugins/external
cd /var/lib/gocd/workdir/plugins/external

echo "Install go-maven-poller"
curl -O https://github.com/aresok/go-maven-poller/releases/download/v0.3.2/go-maven-poller.jar

echo "Install go-npm-poller"
curl -O https://github.com/varchev/go-npm-poller/releases/download/0.2.1/go-npm-poller.jar

echo "Install xunit-converter-task"
curl -O https://github.com/gocd-contrib/xunit-converter-task/releases/download/1.1/xunit-converter-task-1.1.jar

echo "Install gocd-maven-plugin"
curl -O https://github.com/ruckc/gocd-maven-plugin/releases/download/0.1.1/gocd-maven-plugin-0.1.1.jar

echo "Install script-executor-task"
curl -O https://github.com/gocd-contrib/script-executor-task/releases/download/0.2/script-executor-0.2.jar

echo "Install gocd-docker"
curl -O https://github.com/manojlds/gocd-docker/releases/download/0.1.27/docker-task-assembly-0.1.27.jar

echo "Install go-strong-auth-plugin"
curl -O https://github.com/danielsomerfield/go-strong-auth-plugin/releases/download/0.1.0%2B12/strong-auth-0.1-12.jar
