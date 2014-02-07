class proftpd {
    include proftpd::params, proftpd::preinstall, proftpd::install, proftpd::config, proftpd::service 
}
