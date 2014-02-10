class httpd::install::post {

    include baseconf::globalparams

    # step control
    Class["httpd::install::compile"] -> File["conf_dir"] -> File["confd_dir"]
    Class["httpd::install::compile"] -> File["log_dir"]
    Class["httpd::install::compile"] -> File["pid_dir"]
    Class["httpd::install::compile"] -> File["temp_dir"]

    # resource template declare
    File {
        owner   => "${httpd::daemon_user}",
        group   => "${httpd::daemon_group}",
        mode    => '0644',
    }

    # resources declare
    file { "conf_dir":
        ensure  => directory,
        mode    => 0755,
        path    => "${httpd::conf_dir}",
    }

    file { "confd_dir":
        ensure  => directory,
        mode    => 0755,
        path    => "${httpd::confd_dir}",
    }

    file { "log_dir":
        ensure  => directory,
        mode    => 0755,
        path    => "${httpd::log_dir}",
    }

    file { "pid_dir":
        ensure  => directory,
        mode    => 0755,
        path    => "${httpd::pid_dir}",
    }

    file { "temp_dir":
        ensure  => directory,
        mode    => 0755,
        path    => "${httpd::temp_dir}",
    }
}

