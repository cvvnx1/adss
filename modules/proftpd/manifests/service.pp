class proftpd::service {

  service { "proftpd":
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
    require => Class[ ["proftpd::config"], ["proftpd::install"] ],
  }
}
