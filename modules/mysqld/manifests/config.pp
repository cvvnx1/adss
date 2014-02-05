class mysqld::config {

    include mysqld::params

    File {
        owner => 'mysql',
        group => 'mysql',
        mode  => '0644'
    }

    file { "${mysqld::params::pid_dir}":
        ensure => directory,
        require => Class[ "mysqld::install" ],
    }

    file { "${mysqld::params::conf_dir}/my.cnf":
        ensure  => file,
        content => template('mysqld/my.cnf.erb'),
        require => Class[ "mysqld::install" ],
    }
}

