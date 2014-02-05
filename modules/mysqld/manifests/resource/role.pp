
define mysqld::resource::role(
  $server_id        = 1,
  $master_host      = undef,
  $master_user      = undef,
  $master_psw       = undef,
  $master_port      = undef
){

  File {
    owner => 'mysql',
    group => 'mysql',
    mode  => '0644',
  }

  # Create a rep config file.
  file { "${mysqld::params::conf_dir}/conf.d/rep.cnf":
    ensure  => file,
    content => template('mysqld/my_rep.cnf.erb'),
    require => Class[ "mysqld::install" ],
    notify  => Class[ "mysqld::service" ],
  }
}
