class apache::install::prepare {

    include baseconf::globalparams

    # step control
    Package["prepkg_apache"] -> File["worker_dir"] -> File["install_script"]
    Package["prepkg_apache"] -> Group["daemon_group"] -> User["daemon_user"]

    # resource template declare
    File {
        owner   => '${baseconf::globalparams::adminuser}',
        group   => '${baseconf::globalparams::admingroup}',
        mode    => '0644',
    }

    # resource declare
    package { "prepkg_apache":
        ensure => present,
        name => [ "gcc", "make", "apr-devel", "apr-util-devel", "zlib-devel" ],
    }

    file { "worker_dir":
        ensure  => present,
        source  => 'puppet:///modules/apache',
        path    => "${baseconf::globalparams::basepath}/httpd",
        recurse => true,
    }

    file { "install_script":
        ensure  => present,
        mode    => 0755,
        content => template("apache/httpd.setup.erb"),
        path    => "${baseconf::globalparams::basepath}/httpd/setup.sh",
    }

    user { "daemon_user":
        ensure  => present,
        name    => "${apache::params::daemon_user}",
        comment => "${apache::params::daemon_user} user",
        gid     => "${apache::params::daemon_user}",
        shell   => '/sbin/nologin',
    }

    group { "daemon_group":
        ensure  => present,
        name    => "${apache::params::daemon_user}",
    }
}
