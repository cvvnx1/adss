class proftpd::config {

    include proftpd::params

    File {
        owner => 'ftp',
        group => 'ftp',
        mode  => '0644'
    }

    file { "${proftpd::params::pid_dir}":
        ensure => directory,
        require => Class[ "proftpd::install" ],
    }

    file { "${proftpd::params::log_dir}":
        ensure => directory,
        require => Class[ "proftpd::install" ],
    }

    file { "${proftpd::params::conf_dir}/conf.d":
        ensure => directory,
        require => Class[ "proftpd::install" ],
    }

    file { "${proftpd::params::conf_dir}/proftpd.conf":
        ensure  => file,
        content => template('proftpd/proftpd.conf.erb'),
        require => Class[ "proftpd::install" ],
    }

    file { "${proftpd::params::conf_dir}/welcome.msg":
        ensure  => file,
        content => template('proftpd/proftpd.message.erb'),
        require => Class[ "proftpd::install" ],
    }
}

