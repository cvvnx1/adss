# Sample Usage:
#  mysqld::config::rep { 'mysql.test.com':
#      server_id        => '1',                      # (Optional)
#      master_host      => 'master.test.com',
#      master_user      => 'rep',
#      master_psw       => 'rep',
#      master_port      => '3306',                   # (Optional)
#  }
define mysqld::resource::rep (
    $server_id        = '1',
    $master_host      = undef,
    $master_user      = undef,
    $master_psw       = undef,
    $master_port      = '3306',
) {
    include mysqld::params

    # step control
    Class["mysqld::install::post"] -> File["rep_file"]
    File["rep_file"] ~> Class["mysqld::service::control"]

    # resource template declare
    File {
        owner   => "${mysqld::params::daemon_user}",
        group   => "${mysqld::params::daemon_group}",
        mode    => '0644'
    }

    # resources declare
    file { "rep_file":
        ensure  => present,
        content => template('mysqld/my_rep.cnf.erb'),
        path    => "${mysqld::params::confd_dir}/rep.cnf",
    }
}
