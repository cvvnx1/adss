class named {
    include named::params
    include named::install::prepare
    include  named::install::compile
    include  named::install::post
    include named::config::conf
    include named::config::initrc
    include named::service::control
}
