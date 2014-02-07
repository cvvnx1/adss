class apache::config::initrc {

    include baseconf::globalparams, apache::params

    # step control
    Class["apache::config::conf"] -> File["initrc_file"]
    File["initrc_file"] ~> Class["apache::service::control"]

    # resources declare
    file { "initrc_file":
        ensure  => present,
        owner   => "${baseconf::globalparams::adminuser}",
        group   => "${baseconf::globalparams::admingroup}",
        mode    => 0755,
        content => template('apache/httpd.init.erb'),
        path    => "${baseconf::globalparams::initrcpath}/httpd",
    }
}
