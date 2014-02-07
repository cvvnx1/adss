class cacgios::service {

  include cacgios::params

  service { "snmpd":
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
    require => Class[ ["cacgios::config"], ["cacgios::install"] ],
  }

  service { "httpd":
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
    require => Class[ ["cacgios::config"], ["cacgios::install"] ],
  }

  service { "nagios":
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
    require => Class[ ["cacgios::config"], ["cacgios::install"] ],
  }

  service { "ndo2db":
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
    require => Class[ ["cacgios::config"], ["cacgios::install"] ],
  }
}

