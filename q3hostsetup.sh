#!/bin/bash
# TITLE:        q3hostsetup.sh
# DATE:         05/13/2017
# AUTHOR:       Michael Corcoro
# PURPOSE:      Set up rsyslog on q3 host.
# UPDATES:

#copy puppet manifests.
sudo cp -r host/etc/puppet/manifests/* /etc/puppet/manifests/

#copy puppet modules.
sudo cp -r host/etc/puppet/modules/* /etc/puppet/modules/

#apply puppet remote rsyslog docker manifest.
sudo puppet apply /etc/puppet/manifests/remote_docker.pp

#apply puppet rsyslog manifest.
sudo puppet apply /etc/puppet/manifests/remote_syslog.pp

