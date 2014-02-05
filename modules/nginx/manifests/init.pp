class nginx {
    include nginx::params, nginx::preinstall, nginx::install, nginx::config, nginx::service 
}

