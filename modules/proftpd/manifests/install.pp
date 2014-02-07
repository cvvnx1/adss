class proftpd::install {

    include baseconf::globalparams, proftpd::params

    exec { "${baseconf::globalparams::basepath}/proftpd/setup.sh":
        cwd => "${baseconf::globalparams::basepath}/proftpd",
        path => "${baseconf::globalparams::binpath}",
        require => Class[ "proftpd::preinstall" ],
    }

    file { "${baseconf::globalparams::initpath}/proftpd":
        ensure => present,
        owner => 'root',
        group => 'root',
        mode => 0755,
        content => template("proftpd/proftpd.init.erb"),
        require => Exec[ "${baseconf::globalparams::basepath}/proftpd/setup.sh" ],
    }
}

