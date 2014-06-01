class mysqld::service::control {

    include mysqld::params

    # step control
    Class["mysqld::install::post"] -> Service["mysqld"]
    Class["mysqld::config::initrc"] ~> Service["mysqld"]

    service { "mysqld":
        ensure     => running,
        enable     => true,
        hasstatus  => true,
        hasrestart => true,
    }
}

