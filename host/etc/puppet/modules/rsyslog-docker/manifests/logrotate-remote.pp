class rsyslog-docker::logrotate-remote {
  file {
    '/etc/logrotate.d/rsyslog-remote':
      content  => template('rsyslog-docker/logrotate_remote_conf.erb'),
      mode     => 0644,
      owner    => root,
      group    => root
  }
}


