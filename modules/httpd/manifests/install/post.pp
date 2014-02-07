class httpd::install::post {

    include baseconf::globalparams, httpd::params

    # step control
    Class["httpd::install::compile"] -> File["conf_dir"] -> File["confd_dir"]
    Class["httpd::install::compile"] -> File["log_dir"]
    Class["httpd::install::compile"] -> File["pid_dir"]
    Class["httpd::install::compile"] -> File["temp_dir"]

    # resource template declare
    File {
        owner   => "${httpd::params::daemon_user}",
        group   => "${httpd::params::daemon_group}",
        mode    => '0644',
    }

    # resources declare
    file { "conf_dir":
        ensure  => directory,
        mode    => 0755,
        path    => "${httpd::params::conf_dir}",
    }

    file { "confd_dir":
        ensure  => directory,
        mode    => 0755,
        path    => "${httpd::params::conf_dir}/conf.d",
    }

    file { "log_dir":
        ensure  => directory,
        mode    => 0755,
        path    => "${httpd::params::log_dir}",
    }

    file { "pid_dir":
        ensure  => directory,
        mode    => 0755,
        path    => "${httpd::params::pid_dir}",
    }

    file { "temp_dir":
        ensure  => directory,
        mode    => 0755,
        path    => "${httpd::params::temp_dir}",
    }
}

