define tomcat::config::conf(
    $http_port      = '8080',
    $ajp_port       = '8009',
    $jvm_route      = undef,
    $redirect_port  = '8443',
) {

    include baseconf::globalparams

    # step control
    Class["tomcat::install::compile"] -> File["conf_file"]
    File["conf_file"] ~> Class["tomcat::service::control"]

    # resources declare
    file { "conf_file":
        ensure  => present,
        owner   => "${baseconf::globalparams::adminuser}",
        group   => "${baseconf::globalparams::admingroup}",
        mode    => 0600,
        content => template('tomcat/server.xml.erb'),
        path    => "${tomcat::params::conf_dir}/server.xml",
    }
}
