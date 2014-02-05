class mysqld::preinstall {

    include baseconf::globalparams

    package { [ "gcc", "gcc-c++", "make", "cmake", "bison", "ncurses-devel" ] :
        ensure => present,
    }

    file { "${baseconf::globalparams::basepath}/mysqld":
        ensure => present,
        owner => 'root',
        group => 'root',
        mode => 0644,
        source => "puppet:///modules/mysqld",
        recurse => true,
    }

    file { "${baseconf::globalparams::basepath}/mysqld/setup.sh":
        ensure => present,
        owner => 'root',
        group => 'root',
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

