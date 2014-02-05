class puppet::config {
    file { $puppet::param::confpath :
        ensure => present,
        owner => 'root',
        group => 'root',
        mode => 0644,
        content => template("puppet/puppet.erb"),
        require => Class["puppet::install"],
        notify => Class["puppet::service"],
    }

#    file { "/etc/puppet/puppet.conf.test" :
#        ensure => present,
#        owner => 'root',
#        group => 'root',
#        mode => 0644,
#        content => template("puppet/puppet.conf.erb"),
#        require => Class["puppet::install"],
#        notify => Class["puppet::service"],
#    }
}

