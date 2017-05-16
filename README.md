# Updates: 

### host:
* Added new rsyslog-docker puppet module.
* Added manifest for firewall rules for DOCKER chain.
* Added manifest to create rsyslog-remote logrotate config.
* Added scripts to copy and puppet apply modules to each host.

### Docker:
* Updated entrypoint in Dockerfile to launch rsyslogd with -i option for custom pid file (to be used in postrotate script to force releasing of previous log files).
* Added shell script to build v2 image and run container with required parameters. _TODO: MAY WISH TO ADD garethr/docker MODULE FROM PUPPET FORGE TO BUILD AND MANAGE DOCKER CONTAINER_
