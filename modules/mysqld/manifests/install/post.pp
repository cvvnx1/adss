class mysqld::install::post {

    include baseconf::globalparams, mysqld::params

    # step control
    Class["mysqld::install::compile"] -> File["conf_dir"] -> File["confd_dir"]
    Class["mysqld::install::compile"] -> File["log_dir"]
    Class["mysqld::install::compile"] -> File["pid_dir"]
    Class["mysqld::install::compile"] -> File["data_dir"]
    # resource template declare
    File {
        owner   => "${mysqld::params::daemon_user}",
        group   => "${mysqld::params::daemon_group}",
        mode    => '0644',
    }

    # resources declare
    file { "conf_dir":
        ensure  => directory,
        mode    => 0755,
        path    => "${mysqld::params::conf_dir}",
    }

    file { "confd_dir":
        ensure  => directory,
        mode    => 0755,
        path    => "${mysqld::params::confd_dir}",
    }

    file { "data_dir":
        ensure  => directory,
        mode    => 0755,
        path    => "${mysqld::params::data_dir}",
    }

    file { "log_dir":
        ensure  => directory,
        mode    => 0755,
        path    => "${mysqld::params::log_dir}",
    }

    file { "pid_dir":
        ensure  => directory,
        mode    => 0755,
        path    => "${mysqld::params::pid_dir}",
    }
}

