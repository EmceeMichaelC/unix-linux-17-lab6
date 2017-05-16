#!/bin/bash
# TITLE:        dockersetup.sh
# DATE:         05/13/2017
# AUTHOR:       Michael Corcoro
# PURPOSE:      Build docker image from Dockerfile and run container. 
# UPDATES:

#Build the image from the local Dockerfile.
sudo docker build -t uladmin/rsyslog_agg:v2 .

#run image:
## map volume for log storage and pid file.
## port map tcp/udp 514
## run container with init
## run container to share host processes (so we can easily target pid for log rotation)
sudo docker run --name rsyslog -d -v /data/rsyslog:/data/rsyslog -p 514:514 -p 514:514/udp --init=true --init-path /usr/bin/docker-init --pid=host uladmin/rsyslog_agg:v2
