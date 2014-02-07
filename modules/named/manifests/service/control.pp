class named::service::control {

    include named::params

    # step control
    Class["named::config::initrc"] -> Service["named"]
    Class["named::config::conf"] ~> Service["named"]
    Class["named::config::initrc"] ~> Service["named"]
#    Class["named::config::vhost"] ~> Service["named"]

    service { "named":
        ensure     => running,
        enable     => true,
        hasstatus  => true,
        hasrestart => true,
    }
}
