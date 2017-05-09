class rsyslog {
  service {
    'rsyslog':
      ensure    => running,
      enable    => true,
      hasstatus => true
  }
}

