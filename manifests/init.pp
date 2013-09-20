# Class for managing daemontools

class daemontools {

  package { "daemontools-run":
    ensure => latest,
  }

  file { "/var/lib/service":
    ensure => directory,
    owner  => "root",
    group  => "root",
  }
  
  file { "/etc/service":
    ensure  => directory,
    owner   => 'root',
    group   => 'root',
  }

}
