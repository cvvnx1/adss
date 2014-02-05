class cacgios::preinstall {

    include baseconf::globalparams

    package { [ "gcc", "make", "patch", "httpd", "php", "mysql", "mysql-server", "mysql-devel", "php-mysql", "php-devel", "php-snmp", "net-snmp-utils", "rrdtool", "rrdtool-devel", "rrdtool-php" ] :
        ensure => present,
    }

    service { "mysqld":
        ensure     => running,
        enable     => true,
        hasstatus  => true,
        hasrestart => true,
        require    => Package[ "mysql-server" ],
    }

    File {
        owner => 'root',
        group => 'root',
        mode  => '0644'
    }

    file { "${baseconf::globalparams::basepath}/cacgios":
        ensure => present,
        source => "puppet:///modules/cacgios",
        recurse => true,
    }

    file { "/etc/httpd/conf/httpd.conf":
        ensure => present,
        content => template("cacgios/httpd.conf.erb"),
    }

    file { "/etc/snmp/snmpd.conf":
        ensure => present,
        content => template("cacgios/snmpd.conf.erb"),
    }

    file { "${baseconf::globalparams::basepath}/cacgios/cacti_init.sql":
        ensure => present,

        content => template("cacgios/cactidb_init.sql.erb"),
    }

    file { "${baseconf::globalparams::basepath}/cacgios/npc.sql":
        ensure => present,
        content => template("cacgios/npc.sql.erb"),
    }

    file { "${baseconf::globalparams::basepath}/cacgios/setup.sh":
        ensure => present,
        mode => 0755,
        content => template("cacgios/cacgios.setup.erb"),
    }

    user { "apache":
        ensure => present,
        comment => 'apache user',
        gid => [ 'apache', 'nagios' ],
        shell => '/sbin/nologin',
        require => Group[ "apache", "nagios" ],
    }

    group { "apache":
        ensure => present,
    }

    user { "cacti":
        ensure => present,
        comment => 'cacti user',
        gid => 'cacti',
        shell => '/bin/bash',
        require => Group["cacti"],
    }

    group { "cacti":
        ensure => present,
    }

    user { "nagios":
        ensure => present,
        comment => 'nagios user',
        gid => 'nagios',
        shell => '/sbin/nologin',
        require => Group["nagios"],
    }

    group { "nagios":
        ensure => present,
    }
}

