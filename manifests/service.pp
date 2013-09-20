# daemontools::service creates a daemontools service, which involves
# creating a subdirectory in /etc/service for the service, and a script
# named "run" in it that runs the script.
#
# example usage:
# daemontools::service { example:
#     script  => "#!/bin/sh\n exec /usr/bin/example\n",
#     require => Package["example"],
# }

define daemontools::service($script) {

  file { "/var/lib/service/$name":
    ensure => directory,
    owner  => root,
    group  => root,
  }

  file { "/var/lib/service/$name/run":
    content => $script,
    owner   => root,
    group   => root,
    mode    => 0755,
    require => File["/var/lib/service/$name"],
  }
  
  file { "/etc/service/${name}":
    ensure  => link,
    target  => "/var/lib/service/${name}",
    require => File["/var/lib/servce/${name}"],
  }

}
