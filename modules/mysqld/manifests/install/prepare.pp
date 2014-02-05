class mysqld::install::prepare {

    include baseconf::globalparams

    # step control
    Package["prepkg_mysqld"] -> 

    # resource template declare
    File {
        owner   => 'root',
        group   => 'root',
        mode    => '0644',
    }

    # resource declare
    package { "prepkg_mysqld":
        ensure  => present,
        name    => [ "gcc", "gcc-c++", "make", "cmake", "bison", "ncurses-devel" ] :
    }

    file { "${baseconf::globalparams::basepath}/mysqld":
        ensure => present,
        source => "puppet:///modules/mysqld",
        recurse => true,
    }

    file { "${baseconf::globalparams::basepath}/mysqld/setup.sh":
        ensure => present,
        mode => 0755,
        content => template("mysqld/mysqld.setup.erb"),
    }

    user { "mysql":
        ensure => present,
        comment => 'mysqld user',
        gid => 'mysql',
        shell => '/sbin/nologin',
        require => Group["mysql"],
    }

    group { "mysql":
        ensure => present,
    }
}

