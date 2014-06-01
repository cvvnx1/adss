class baseconf::environment {

    include baseconf::globalparams

    # step control
    File["firewall_conf"] ~> Service["firewall_serv"]
    File["sshd_conf"] ~> Service["sshd_serv"]
#    File["yum_repo_sh"] -> Exec["yum_repo_sh"]

    # resources template declare
    File {
        owner      => "${baseconf::globalparams::adminuser}",
        group      => "${baseconf::globalparams::admingroup}",
        mode       => "0644",
        path       => "${baseconf::globalparams::basepath}",
    }

    # resources declare
    file { "adss_files":
        ensure     => directory,
        mode       => 0755,
    }

    file { "firewall_conf":
        ensure     => present,
        path       => "${baseconf::globalparams::firewallconf}",
        content    => template('baseconf/firewall.conf.erb'),
    }

    service { "firewall_serv":
        name       => "${baseconf::globalparams::firewallserv}",
        ensure     => "running",
        enable     => "true",
        hasstatus  => "true",
        hasrestart => "true",
    }

    file { "sshd_conf":
        ensure     => present,
        path       => "${baseconf::globalparams::sshdconf}",
        content    => template('baseconf/sshd.conf.erb'),
    }

    service { "sshd_serv":
        name       => "${baseconf::globalparams::sshdserv}",
        ensure     => "running",
        enable     => "true",
        hasstatus  => "true",
        hasrestart => "true",
    }

    file { "sysctl_conf":
        ensure     => present,
        path       => "${baseconf::globalparams::sysctlconf}",
        content    => template('baseconf/sysctl.conf.erb'),
    }

#    if $operatingsystem == "OS" {
#        file { "yum_repo_sh":
#            ensure     => present,
#            mode       => 0755,
#            path       => "${baseconf::globalparams::basepath}/yum.sh",
#            content    => template('baseconf/yum.sh.erb'),
#        }

#        exec { "yum_repo_sh":
#            cwd      => "${baseconf::globalparams::basepath}",
#            command  => "${baseconf::globalparams::basepath}/yum.sh",
#            path     => "${baseconf::globalparams::binpath}",
#        }

#        file { "selinux_conf":
#            ensure     => present,
#            path       => "/etc/selinux/config",
#            content    => template('baseconf/selinux.conf.erb'),
#        }
#    }

#    file { "${baseconf::globalparams::basepath}/baseconf":
#        ensure     => present,
#        source     => "${baseconf::globalparams::baseconfpath}",
#    }
}
