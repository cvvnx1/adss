class apache::install::post {

    include baseconf::globalparams, apache::params

    # step control
    Class["apache::install::compile"] -> File["temp_dir"]
    Class["apache::install::compile"] -> File["log_dir"]
    Class["apache::install::compile"] -> File["pid_dir"]
    Class["apache::install::compile"] -> File["data_dir"]
    Class["apache::install::compile"] -> File["conf_dir"] -> File["confd_dir"]

    # resources declare
    file { "temp_dir":
        ensure  => directory,
        owner   => "${apache::params::daemon_user}",
        group   => "${apache::params::daemon_user}",
        mode    => 0755,
        path    => "${apache::params::temp_dir}",
    }

    file { "log_dir":
        ensure  => directory,
        owner   => "${apache::params::daemon_user}",
        group   => "${apache::params::daemon_user}",
        mode    => 0755,
        path    => "${apache::params::log_dir}",
    }

    file { "pid_dir":
        ensure  => directory,
        owner   => "${apache::params::daemon_user}",
        group   => "${apache::params::daemon_user}",
        mode    => 0755,
        path    => "${apache::params::pid_dir}",
    }

    file { "data_dir":
        ensure  => directory,
        owner   => "${apache::params::daemon_user}",
        group   => "${apache::params::daemon_user}",
        mode    => 0755,
        path    => "${apache::params::data_dir}",
    }

    file { "conf_dir":
        ensure  => directory,
        owner   => "${apache::params::daemon_user}",
        group   => "${apache::params::daemon_user}",
        mode    => 0755,
        path    => "${apache::params::conf_dir}",
    }

    file { "confd_dir":
        ensure  => directory,
        owner   => "${apache::params::daemon_user}",
        group   => "${apache::params::daemon_user}",
        mode    => 0755,
        path    => "${apache::params::conf_dir}/conf.d",
    }
}

