# Sample Usage:
#  named::config::view { 'www.test.com':
#      view_name          => ["CHINANET","CNC"],
#      match_clients_acl  => ["CHINANET","CNC"],
#      allow_qurey_cache  => ["none","none"],
#      allow_recursion    => ["none","none"],
#      allow_transfer     => ["none","none"],
#      recursion          => ["no","no"],
#      mysql_host         => '127.0.0.1',               # It must be IP address not hostname
#      mysql_dbname       => 'dns',                     # (Optional)
#      mysql_ssl          => 'false',                   # (Optional)
#      mysql_port         => '3306',                    # (Optional)
#      mysql_user         => 'bind',
#      mysql_psw          => 'bind',
#  }
define named::config::view (
    $view_name          = undef,
    $match_clients_acl  = undef,
    $allow_qurey_cache  = undef,
    $allow_recursion    = undef,
    $allow_transfer     = undef,
    $recursion          = undef,
    $mysql_host         = undef,
    $mysql_dbname       = 'dns',
    $mysql_ssl          = false,
    $mysql_port         = 3306,
    $mysql_user         = undef,
    $mysql_psw          = undef,
) {

    include baseconf::globalparams, named::params

    # step control
    Class["named::config::conf"] -> File["view_file"] -> File["view_sql_file"]
    File["view_file"] -> File["view_sql_file"] ~> Class["named::service::control"]

    # resources declare
    file { "view_file":
        ensure  => present,
        owner   => "${baseconf::globalparams::adminuser}",
        group   => "${baseconf::globalparams::admingroup}",
        mode    => 0644,
        content => template('named/view.conf.erb'),
        path    => "${named::params::conf_dir}/conf.d/view.conf",
    }

    file { "view_sql_file":
        ensure  => present,
        owner   => "${baseconf::globalparams::adminuser}",
        group   => "${baseconf::globalparams::admingroup}",
        mode    => 0644,
        content => template('named/view.sql.erb'),
        path    => "${named::params::prefix_dir}/view.sql",
    }

    file { "chinanet_acl":
        ensure  => present,
        owner   => "${baseconf::globalparams::adminuser}",
        group   => "${baseconf::globalparams::admingroup}",
        mode    => 0644,
        content => template('named/CHINANET.acl.erb'),
        path    => "${named::params::conf_dir}/conf.d/CHINANET.acl",
    }

    file { "cnc_acl":
        ensure  => present,
        owner   => "${baseconf::globalparams::adminuser}",
        group   => "${baseconf::globalparams::admingroup}",
        mode    => 0644,
        content => template('named/CNC.acl.erb'),
        path    => "${named::params::conf_dir}/conf.d/CNC.acl",
    }
}
