class mysqld::config::initrc {

    include baseconf::globalparams

    # step control
    Class["mysqld::install::post"] -> File["initrc_file"]
    File["initrc_file"] ~> Class["mysqld::service::control"]

    # resource template declare
    File {
        owner   => "${baseconf::globalparams::adminuser}",
        group   => "${baseconf::globalparams::admingroup}",
        mode    => '0755'
    }

    # resources declare
    file { "initrc_file":
        ensure  => present,
        content => template('mysqld/mysqld.init.erb'),
        path    => "${baseconf::globalparams::initrcpath}/mysqld",
    }
}
