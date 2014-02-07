class nginx::install {

    include baseconf::globalparams, nginx::params

    exec { "${baseconf::globalparams::basepath}/nginx/setup.sh":
        cwd => "${baseconf::globalparams::basepath}/nginx",
        path => "${baseconf::globalparams::binpath}",
        require => Class[ "nginx::preinstall" ],
    }

    file { "${baseconf::globalparams::initpath}/nginx":
        ensure => present,
        owner => 'root',
        group => 'root',
        mode => 0755,
        content => template("nginx/nginx.init.erb"),
        require => Exec[ "${baseconf::globalparams::basepath}/nginx/setup.sh" ],
    }
}

