class puppet::preinstall {

    include baseconf::globalparams

    package { [ "rubygems", "augeas-libs", "libselinux-ruby", "dmidecode", "pciutils", "virt-what" ] :
        ensure => present,
    }

    file { "$baseconf::globalparams::basepath/puppet":
        ensure => present,
        owner => 'root',
        group => 'root',
        mode => 0644,
        source => "puppet:///modules/puppet/pkg",
        recurse => true,
    }

    user { "puppet":
        ensure => present,
        comment => 'puppet user',
        gid => 'puppet',
        shell => '/sbin/nologin',
        home => '/home/puppet',
        require => Group["puppet"],
    }

    group { "puppet":
        ensure => present,
    }

    exec { "ruby-augeas-0.4.1":
        command => "rpm -ivh --force ./ruby-augeas-0.4.1-1.el6.x86_64.rpm",
        cwd => "$baseconf::globalparams::basepath/puppet",
        path => $baseconf::globalparams::binpath,
        onlyif => '[ $(rpm -qa | grep ruby-augeas-0.4.1 | wc -l) -eq 0 ]',
    }

    exec { "ruby-rgen-0.6.5":
        command => "rpm -ivh --force ./ruby-rgen-0.6.5-1.el6.noarch.rpm",
        cwd => "$baseconf::globalparams::basepath/puppet",
        path => $baseconf::globalparams::binpath,
        onlyif => '[ $(rpm -qa | grep ruby-rgen-0.6.5 | wc -l) -eq 0 ]',
    }

    exec { "ruby-shadow-1.4.1":
        command => "rpm -ivh --force ./ruby-shadow-1.4.1-13.el6.x86_64.rpm",
        cwd => "$baseconf::globalparams::basepath/puppet",
        path => $baseconf::globalparams::binpath,
        onlyif => '[ $(rpm -qa | grep ruby-shadow-1.4.1 | wc -l) -eq 0 ]',
    }

    exec { "rubygem-json-1.4.6":
        command => "rpm -ivh --force ./rubygem-json-1.4.6-1.el6.x86_64.rpm",
        cwd => "$baseconf::globalparams::basepath/puppet",
        path => $baseconf::globalparams::binpath,
        onlyif => '[ $(rpm -qa | grep rubygem-json-1.4.6 | wc -l) -eq 0 ]',
    }

    exec { "hiera-1.2.1":
        command => "rpm -ivh --force ./hiera-1.2.1-1.el6.noarch.rpm",
        cwd => "$baseconf::globalparams::basepath/puppet",
        path => $baseconf::globalparams::binpath,
        onlyif => '[ $(rpm -qa | grep hiera-1.2.1 | wc -l) -eq 0 ]',
        require => Exec["rubygem-json-1.4.6"],
    }

    exec { "facter-1.7.2":
        command => "rpm -ivh --force ./facter-1.7.2-1.el6.x86_64.rpm",
        cwd => "$baseconf::globalparams::basepath/puppet",
        path => $baseconf::globalparams::binpath,
        onlyif => '[ $(rpm -qa | grep facter-1.7.2 | wc -l) -eq 0 ]',
    }
}

