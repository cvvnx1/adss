class apache::config::conf {

    include baseconf::globalparams

    # step control
    Class["apache::install::post"] -> File["conf_file"]
    File["conf_file"] ~> Class["apache::service::control"]

    # resources declare
    file { "conf_file":
        ensure  => present,
        owner   => "${baseconf::globalparams::adminuser}",
        group   => "${baseconf::globalparams::admingroup}",
        mode    => 0644,
        content => template('apache/httpd.conf.erb'),
        path    => "${apache::params::conf_dir}/httpd.conf",
    }
}
