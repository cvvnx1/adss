class tomcat {
    include tomcat::params
    include tomcat::install::prepare, tomcat::install::compile, tomcat::install::post
    include tomcat::config::initrc
    include tomcat::service::control
}
