class tomcat::config::initrc {

    include baseconf::globalparams, tomcat::params

    # step control
    File["initrc_file"] ~> Class["tomcat::service::control"]

    # resources declare
    file { "initrc_file":
        ensure  => present,
        owner   => "${baseconf::globalparams::adminuser}",
        group   => "${baseconf::globalparams::admingroup}",
        mode    => 0755,
        content => template('tomcat/tomcat.init.erb'),
        path    => "${baseconf::globalparams::initrcpath}/tomcat",
    }
}
