class named::config::initrc {

    include baseconf::globalparams, named::params

    # step control
    Class["named::config::conf"] -> File["initrc_file"]
    File["initrc_file"] ~> Class["named::service::control"]

    # resources declare
    file { "initrc_file":
        ensure  => present,
        owner   => "${baseconf::globalparams::adminuser}",
        group   => "${baseconf::globalparams::admingroup}",
        mode    => 0755,
        content => template('named/named.init.erb'),
        path    => "${baseconf::globalparams::initrcpath}/named",
    }
}
