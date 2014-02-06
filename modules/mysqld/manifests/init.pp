class mysqld {
    include mysqld::params
    include mysqld::install::prepare, mysqld::install::compile, mysqld::install::post
    include mysqld::config::initrc
    include mysqld::service::control
}
