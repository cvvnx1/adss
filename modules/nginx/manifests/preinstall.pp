class nginx::preinstall {

    include baseconf::globalparams

    package { [ "gcc", "make" ] :
        ensure => present,
    }

    file { "${baseconf::globalparams::basepath}/nginx":
        ensure => present,
        owner => 'root',
        group => 'root',
        mode => 0644,
        source => "puppet:///modules/nginx",
        recurse => true,
    }

    file { "${baseconf::globalparams::basepath}/nginx/setup.sh":
        ensure => present,
        owner => 'root',
        group => 'root',
        mode => 0755,
        content => template("nginx/nginx.setup.erb"),
    }

    user { "nginx":
        ensure => present,
        comment => 'nginx user',
        gid => 'puppet',
        shell => '/sbin/nologin',
        home => '/home/puppet',
        require => Group["nginx"],
    }

    group { "nginx":
        ensure => present,
    }
}

