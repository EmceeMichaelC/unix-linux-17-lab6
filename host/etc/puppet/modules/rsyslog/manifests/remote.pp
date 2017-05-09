class rsyslog::remote {
  include rsyslog
  file {
    '/etc/rsyslog.d/30-remote.conf':
      content  => template('rsyslog/remote_conf.erb'),
      mode     => 0444,
      owner    => root,
      group    => root,
      notify   => Service['rsyslog']
  }
}
