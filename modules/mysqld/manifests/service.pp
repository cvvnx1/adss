class mysqld::service {

  service { "mysqld":
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
    require => Class[ ["mysqld::config"], ["mysqld::install"], ["mysqld::config"] ],
  }
}

