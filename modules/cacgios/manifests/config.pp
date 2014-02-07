class cacgios::config {

    include cacgios::params

    File {
        owner => 'root',
        group => 'root',
        mode  => '0644'
    }

    file { "${cacgios::params::httpd_documentroot}/cacti/include/config.php":
        ensure  => file,
        content => template('cacgios/cacti_config.php.erb'),
        require => Class[ "cacgios::install" ],
    }

    file { "${cacgios::params::httpd_documentroot}/cacti/rra":
        ensure  => directory,
        owner   => 'cacti',
        group   => 'cacti',
        require => Class[ "cacgios::install" ],
    }

    file { "${cacgios::params::httpd_documentroot}/cacti/log":
        ensure  => directory,
        owner   => 'cacti',
        group   => 'cacti',
        require => Class[ "cacgios::install" ],
    }

    file { "/etc/httpd/conf.d/nagios.conf":
        ensure  => present,
        content => template("cacgios/httpd_nagios.conf.erb"),
        require => Class[ "cacgios::install" ],
    }

    file { "${cacgios::params::nagios_prefix_dir}/etc/cgi.cfg":
        ensure  => present,
        content => template("cacgios/nagios_cgi.cfg.erb"),
        require => Class[ "cacgios::install" ],
    }

    file { "${cacgios::params::nagios_prefix_dir}/etc/ndo2db.cfg":
        ensure  => present,
        content => template("cacgios/ndo2db.cfg.erb"),
        require => Class[ "cacgios::install" ],
    }

    file { "${cacgios::params::nagios_prefix_dir}/etc/ndomod.cfg":
        ensure  => present,
        content => template("cacgios/ndomod.cfg.erb"),
        require => Class[ "cacgios::install" ],
    }

    file { "/etc/init.d/ndo2db":
        ensure  => present,
        mode    => 0755,
        content => template("cacgios/ndo2db_init.erb"),
        require => Class[ "cacgios::install" ],
    }

    cron { "cacti_poller":
        command => 'php /var/www/html/cacti/poller.php  > /dev/null &',
        user    => 'root',
        minute  => '*/5',
        require => Class[ "cacgios::install" ],
    }
}
