class mysqld::install {

    include baseconf::globalparams, mysqld::params

    exec { "${baseconf::globalparams::basepath}/mysqld/setup.sh":
        cwd => "${baseconf::globalparams::basepath}/mysqld",
        path => "${baseconf::globalparams::binpath}",
        require => Class[ "mysqld::preinstall" ],
    }

    file { "${baseconf::globalparams::initpath}/mysqld":
        ensure => present,
        owner => 'root',
        group => 'root',
        mode => 0755,
        content => template("mysqld/mysqld.init.erb"),
        require => Exec[ "${baseconf::globalparams::basepath}/mysqld/setup.sh" ],
    }
}

