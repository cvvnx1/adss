class puppet::install {
#    exec { "puppet-2.7.22":
#        command => "rpm -ivh --force ./puppet-2.7.22-1.el6.noarch.rpm",
#        cwd => "$baseconf::globalparams::basepath/puppet",
#        path => $baseconf::globalparams::binpath,
#        onlyif => '[ $(rpm -qa | grep puppet-2.7.22 | wc -l) -eq 0 ]',
#        require => Class["puppet::preinstall"],
#    }

    exec { "puppet-3.2.3":
        command => "rpm -ivh --force ./puppet-3.2.3-1.el6.noarch.rpm",
        cwd => "$baseconf::globalparams::basepath/puppet",
        path => $baseconf::globalparams::binpath,
        onlyif => '[ $(rpm -qa | grep puppet-3.2.3 | wc -l) -eq 0 ]',
        require => Class["puppet::preinstall"],
    }

}
