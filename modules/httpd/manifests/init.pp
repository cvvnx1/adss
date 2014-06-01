class httpd {
    include httpd::params
    include httpd::install::prepare, httpd::install::compile, httpd::install::post
    include httpd::config::initrc
    include httpd::service::control
}

