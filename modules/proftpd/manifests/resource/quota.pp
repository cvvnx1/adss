define proftpd::resource::quota(){
  File {
    owner => 'ftp',
    group => 'ftp',
    mode  => '0644',
  }

  # Create a quota config file.
  file { "${proftpd::params::conf_dir}/conf.d/quota.conf":
    ensure  => file,
    content => template('proftpd/proftpd_quota.conf.erb'),
    require => Class[ "proftpd::install" ],
    notify  => Class['proftpd::service'],
  }
}
