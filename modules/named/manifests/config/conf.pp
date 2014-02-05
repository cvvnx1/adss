class named::config::conf {

    include baseconf::globalparams

    # step control
    Class["named::install::post"] -> File["conf_file"]
    File["conf_file"] ~> Class["named::service::control"]

    # resources declare
    file { "conf_file":
        ensure  => present,
        owner   => "${baseconf::globalparams::adminuser}",
        group   => "${baseconf::globalparams::admingroup}",
        mode    => 0644,
        content => template('named/named.conf.erb'),
        path    => "${named::params::conf_dir}/named.conf",
    }
}
