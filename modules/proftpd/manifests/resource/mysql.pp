define proftpd::resource::mysql(
  $mysqlhost          = undef,
  $mysqlport          = '3306',
  $mysqlacc           = 'proftpd',
  $mysqlpsw           = 'proftpd',
  $mysqldb            = 'proftpd'
){
  File {
    owner => 'ftp',
    group => 'ftp',
    mode  => '0644',
  }

  # Create a mysql config file.
  file { "${proftpd::params::conf_dir}/conf.d/mysql.conf":
    ensure  => file,
    content => template('proftpd/proftpd_mysql.conf.erb'),
    require => Class[ "proftpd::install" ],
    notify  => Class['proftpd::service'],
  }

  # Create a sql file for mysql config
  file { "${proftpd::params::prefix_dir}/proftpd.sql":
    ensure  => file,
    content => template('proftpd/proftpd_mysql.sql.erb'),
    require => Class[ "proftpd::install" ],
    notify  => Class['proftpd::service'],
  }
}
