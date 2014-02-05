class named::install::prepare {

    include baseconf::globalparams

    # step control
    Package["prepkg_named"] -> File["worker_dir"] -> File["install_script"]
    Package["prepkg_named"] -> Group["daemon_group"] -> User["daemon_user"]

    # resources declare
    package { "prepkg_named":
        ensure => present,
        name => [ "gcc", "make", "perl", "mysql-devel" ],
    }

    file { "worker_dir":
        ensure  => present,
        owner   => "${baseconf::globalparams::adminuser}",
        group   => "${baseconf::globalparams::admingroup}",
        mode    => 0644,
        source  => 'puppet:///modules/named',
        path    => "${baseconf::globalparams::basepath}/named",
        recurse => true,
    }

    file { "install_script":
        ensure  => present,
        owner   => "${baseconf::globalparams::adminuser}",
        group   => "${baseconf::globalparams::admingroup}",
        mode    => 0755,
        content => template("named/named.setup.erb"),
        path    => "${baseconf::globalparams::basepath}/named/setup.sh",
    }

    user { "daemon_user":
        ensure  => present,
        name    => "${named::params::daemon_user}",
        comment => "${named::params::daemon_user} user",
        gid     => "${named::params::daemon_user}",
        shell   => '/sbin/nologin',
    }

    group { "daemon_group":
        ensure  => present,
        name    => "${named::params::daemon_user}",
    }
}
