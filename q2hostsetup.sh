#!/bin/bash
# TITLE:        q3hostsetup.sh
# DATE:         05/13/2017
# AUTHOR:       Michael Corcoro
# PURPOSE:      Set up rsyslog on q3 host.
# UPDATES:


# copy puppet manifest
sudo cp host/etc/puppet/manifests/remote_syslog.pp /etc/puppet/manifests/

# copy puppet module
sudo cp -R host/etc/puppet/modules/rsyslog/ /etc/puppet/modules/

# run puppet
sudo puppet apply /etc/puppet/manifests/remote_syslog.pp
