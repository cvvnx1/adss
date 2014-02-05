class proftpd::preinstall {

    include baseconf::globalparams

    package { [ "gcc", "make", "mysql-devel" ] :
        ensure => present,
    }

    file { "${baseconf::globalparams::basepath}/proftpd":
        ensure => present,
        owner => 'root',
        group => 'root',
        mode => 0644,
        source => "puppet:///modules/proftpd",
        recurse => true,
    }

    file { "${baseconf::globalparams::basepath}/proftpd/setup.sh":
        ensure => present,
        owner => 'root',
        group => 'root',
        mode => 0755,
        content => template("proftpd/proftpd.setup.erb"),
    }

    user { "ftp":
        ensure => present,
        comment => 'proftpd user',
        gid => 'ftp',
        shell => '/sbin/nologin',
        require => Group["ftp"],
    }

    group { "ftp":
        ensure => present,
    }
}

