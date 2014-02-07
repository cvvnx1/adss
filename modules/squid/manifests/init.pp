class apache {
    include apache::params
    include apache::install::prepare, apache::install::compile, apache::install::post
    include apache::config::conf, apache::config::initrc
    include apache::service::control
}

