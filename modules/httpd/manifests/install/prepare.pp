class httpd::install::prepare {

    include baseconf::globalparams

    # step control
    Package["prepkg"] -> File["worker_dir"] -> File["install_script"]
    Package["prepkg"] -> Group["daemon_group"] -> User["daemon_user"]

    # resources template declare
    File {
        owner   => "${baseconf::globalparams::adminuser}",
        group   => "${baseconf::globalparams::admingroup}",
        mode    => "0644",
    }

    # resources declare
    package { "prepkg":
        ensure => present,
        name => [ "gcc", "make", "apr-devel", "apr-util-devel", "zlib-devel" ],
    }

    file { "worker_dir":
        ensure  => present,
        source  => 'puppet:///modules/httpd',
        path    => "${baseconf::globalparams::basepath}/httpd",
        recurse => true,
    }

    file { "install_script":
        ensure  => present,
        mode    => 0755,
        content => template("httpd/httpd.setup.erb"),
        path    => "${baseconf::globalparams::basepath}/httpd/setup.sh",
    }

    user { "daemon_user":
        ensure  => present,
        name    => "${httpd::params::daemon_user}",
        comment => "${httpd::params::daemon_user} user",
        gid     => "${httpd::params::daemon_group}",
        shell   => '/sbin/nologin',
    }

    group { "daemon_group":
        ensure  => present,
        name    => "${httpd::params::daemon_group}",
    }
}
