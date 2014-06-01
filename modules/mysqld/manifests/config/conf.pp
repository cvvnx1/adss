# Sample Usage:
#  mysqld::config::conf { 'mysql.test.com':
#      port                        => '3306',        # (Optional)
#      key_buffer_size             => '16M',         # (Optional)
#      max_allowed_packet          => '1M',          # (Optional)
#      table_open_cache            => '64',          # (Optional)
#      sort_buffer_size            => '512K',        # (Optional)
#      net_buffer_length           => '8K',          # (Optional)
#      read_buffer_size            => '256K',        # (Optional)
#      read_rnd_buffer_size        => '512K',        # (Optional)
#      myisam_sort_buffer_size     => '8M',          # (Optional)
#      max_allowed_packet          => '16M',         # (Optional)
#      key_buffer_size             => '20M',         # (Optional)
#      sort_buffer_size            => '20M',         # (Optional)
#      read_buffer                 => '2M',          # (Optional)
#      write_buffer                => '2M',          # (Optional)
#  }
define mysqld::config::conf (
    $port                        = '3306',
    $key_buffer_size             = '16M',
    $max_allowed_packet          = '1M',
    $table_open_cache            = '64',
    $sort_buffer_size            = '512K',
    $net_buffer_length           = '8K',
    $read_buffer_size            = '256K',
    $read_rnd_buffer_size        = '512K',
    $myisam_sort_buffer_size     = '8M',
    $max_allowed_packet          = '16M',
    $key_buffer_size             = '20M',
    $sort_buffer_size            = '20M',
    $read_buffer                 = '2M',
    $write_buffer                = '2M',

    $log_bin                     = 'mysql-bin',
    $binlog_format               = 'mixed',
) {
    include mysqld::params

    # step control
    Class["mysqld::install::post"] -> File["conf_file"]
    File["conf_file"] ~> Class["mysqld::service::control"]

    # resource template declare
    File {
        owner   => "${mysqld::params::daemon_user}",
        group   => "${mysqld::params::daemon_group}",
        mode    => '0644'
    }

    # resources declare
    file { "conf_file":
        ensure  => present,
        content => template('mysqld/my.cnf.erb'),
        path    => "${mysqld::params::conf_dir}/my.cnf",
    }
}
