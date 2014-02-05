class tomcat::service::control {

    # step control
    Class["tomcat::config::initrc"] -> Service["tomcat"]
    Class["tomcat::config::initrc"] ~> Service["tomcat"]
#    Class["tomcat::config::vhost"] ~> Service["tomcat"]

    # resources declare
    service { "tomcat":
        ensure     => running,
        enable     => true,
        hasstatus  => true,
        hasrestart => true,
    }
}
