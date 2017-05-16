#Resources to support docker container running rsyslog
class rsyslog-docker::container-support {
  file {
      '/data/':
	ensure   => directory,
	mode     => 0777,
	owner    => root,
	group    => root,
  }

  file {
    '/data/rsyslog/':
	  ensure   => directory,
      mode     => 0777,
      owner    => root,
      group    => root,
  }

# Re-create following docker rules for rsyslog, but filter by ip addresses.
# -A DOCKER -d 172.17.0.2/32 ! -i docker0 -o docker0 -p tcp -m tcp --dport 514 -j ACCEPT
# -A DOCKER -d 172.17.0.2/32 ! -i docker0 -o docker0 -p udp -m udp --dport 514 -j ACCEPT

  class { 'firewall': }
 
  firewall { '001 allow tcp 514 from localhost':
  	chain   => 'DOCKER',
	source  => '127.0.0.1/32',
	destination => '172.17.0.2/32',
	iniface => '! docker0',
	outiface => 'docker0',
	proto   => 'tcp',
	dport   => '514',
	action  => 'accept',
  }

  firewall { '002 allow udp 514 from localhost':
  	chain   => 'DOCKER',
	source  => '127.0.0.1/32',
	destination => '172.17.0.2/32',
	iniface => '! docker0',
	outiface => 'docker0',
	proto   => 'udp',
	dport   => '514',
	action  => 'accept',
  }


  firewall { '003 allow tcp 514 from q2 server':
  	chain   => 'DOCKER',
	source  => '10.0.2.15/32',
	destination => '172.17.0.2/32',
	iniface => '! docker0',
	outiface => 'docker0',
	proto   => 'tcp',
	dport   => '514',
	action  => 'accept',
  }

  firewall { '004 allow udp 514 from q2 server':
  	chain   => 'DOCKER',
	source  => '10.0.2.15/32',
	destination => '172.17.0.2/32',
	iniface => '! docker0',
	outiface => 'docker0',
	proto   => 'udp',
	dport   => '514',
	action  => 'accept',
  }

 firewall { '005 reject all other traffic':
	chain   => 'DOCKER',
	proto   => 'all',
	action  => 'reject',
  }
	
  include rsyslog-docker::logrotate-remote
}
