class mysqld {
    include mysqld::params, mysqld::preinstall, mysqld::install, mysqld::config, mysqld::service 
}
