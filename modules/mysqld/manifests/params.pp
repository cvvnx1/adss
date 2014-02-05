class mysqld::params {

#    $version                  = '/usr/local/mysql/bin/mysqld  Ver 5.5.27 for Linux on x86_64 (Source distribution)'
    $version                  = '/usr/local/mysql/bin/mysqld  Ver 5.5.27-log for Linux on x86_64 (Source distribution)'

    $pkg                      = 'mysql-5.5.27.tar.gz'

    $run_dir                  = '/var/run/mysqld'
    $prefix_dir               = '/usr/local/mysql'
    $conf_dir                 = '/usr/local/mysql'
    $data_dir                 = '/opt/mysql'
    $temp_dir                 = '/opt/mysql/tmp'
    $log_dir = $kernel ? {
        /(?i-mx:linux)/       => '/var/log',
    }
    $pid_dir = $kernel ? {
        /(?i-mx:linux)/       => '/var/run/mysqld',
    }

    $daemon_user = $operatingsystem ? {
        /(?i-mx:fedora|rhel|centos|suse|opensuse)/ => 'mysql',
    }

    $charset                     = 'utf8'
    $collation                   = 'utf8_general_ci'

    $sock                        = '/opt/mysql/tmp/mysql.sock'

    $port                        = 3306
    $key_buffer_size             = '16M'
    $max_allowed_packet          = '1M'
    $table_open_cache            = 64
    $sort_buffer_size            = '512K'
    $net_buffer_length           = '8K'
    $read_buffer_size            = '256K'
    $read_rnd_buffer_size        = '512K'
    $myisam_sort_buffer_size     = '8M'

#    $max_allowed_packet          = '16M'

#    $key_buffer_size             = '20M'
#    $sort_buffer_size            = '20M'
    $read_buffer                 = '2M'
    $write_buffer                = '2M'


}

