class named::install::post {

    include baseconf::globalparams, named::params

    # step control
    Class["named::install::compile"] -> File["temp_dir"]
    Class["named::install::compile"] -> File["pid_dir"]
    Class["named::install::compile"] -> File["conf_dir"] -> File["confd_dir"]

    # resources declare
    file { "temp_dir":
        ensure  => directory,
        owner   => "${named::params::daemon_user}",
        group   => "${named::params::daemon_user}",
        mode    => 0755,
        path    => "${named::params::temp_dir}",
    }

    file { "pid_dir":
        ensure  => directory,
        owner   => "${named::params::daemon_user}",
        group   => "${named::params::daemon_user}",
        mode    => 0755,
        path    => "${named::params::pid_dir}",
    }

    file { "conf_dir":
        ensure  => directory,
        owner   => "${named::params::daemon_user}",
        group   => "${named::params::daemon_user}",
        mode    => 0755,
        path    => "${named::params::conf_dir}",
    }

    file { "confd_dir":
        ensure  => directory,
        owner   => "${named::params::daemon_user}",
        group   => "${named::params::daemon_user}",
        mode    => 0755,
        path    => "${named::params::conf_dir}/conf.d",
    }
}

