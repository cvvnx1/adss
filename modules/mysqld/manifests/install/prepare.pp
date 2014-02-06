class mysqld::install::prepare {

    include baseconf::globalparams, mysqld::params

    # step control
    Package["prepkg"] -> File["worker_dir"] -> File["install_script"]
    Package["prepkg"] -> Group["daemon_group"] -> User["daemon_user"]

    # resource template declare
    File {
        owner   => "${baseconf::globalparams::adminuser}",
        group   => "${baseconf::globalparams::admingroup}",
        mode    => "0644",
    }

    # resource declare
    package { "prepkg":
        ensure  => present,
        name    => [ "gcc", "gcc-c++", "make", "cmake", "bison", "ncurses-devel" ],
    }

    file { "worker_dir":
        ensure  => present,
        source  => "puppet:///modules/mysqld",
        path    => "${baseconf::globalparams::basepath}/mysqld",
        recurse => true,
    }

    file { "install_script":
        ensure  => present,
        mode    => 0755,
        content => template("mysqld/mysqld.setup.erb"),
        path    => "${baseconf::globalparams::basepath}/mysqld/setup.sh",
    }

    user { "daemon_user":
        ensure  => present,
        name    => "${mysqld::params::daemon_user}",
        comment => "${mysqld::params::daemon_user} user",
        gid     => "${mysqld::params::daemon_group}",
        shell   => "/sbin/nologin",
    }

    group { "daemon_group":
        ensure  => present,
        name    => "${mysqld::params::daemon_group}",
    }
}

