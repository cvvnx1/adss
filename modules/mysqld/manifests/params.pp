class mysqld::params {

    ############################
    # install parameters       #
    ############################
#    $version                  = '/usr/local/mysql/bin/mysqld  Ver 5.5.27 for Linux on x86_64 (Source distribution)'
    $version                  = '/usr/local/mysql/bin/mysqld  Ver 5.5.27-log for Linux on x86_64 (Source distribution)'

    $compile_pkg              = 'mysql-5.5.27.tar.gz'

    $prefix_dir               = '/usr/local/mysql'
    $conf_dir                 = '/usr/local/mysql/conf'
    $confd_dir                = '/usr/local/mysql/conf/conf.d'

    $data_dir                 = '/opt/mysql/dbinstance'

    $log_dir = $kernel ? {
        /(?i-mx:linux)/       => '/var/log',
    }
    $pid_dir = $kernel ? {
        /(?i-mx:linux)/       => '/var/run/mysqld',
    }
    $run_dir                  = '/var/run/mysqld'

    $daemon_user = $operatingsystem ? {
        /(?i-mx:fedora|rhel|centos|suse|opensuse)/ => 'mysql',
    }

    $daemon_group = $operatingsystem ? {
        /(?i-mx:fedora|rhel|centos|suse|opensuse)/ => 'mysql',
    }

    $charset                     = 'utf8'
    $collation                   = 'utf8_general_ci'

    $sock                        = '/opt/mysql/tmp/mysql.sock'
}

