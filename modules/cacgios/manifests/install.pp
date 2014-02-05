class cacgios::install {

    include baseconf::globalparams, cacgios::params

    exec { "${baseconf::globalparams::basepath}/cacgios/setup.sh":
        cwd => "${baseconf::globalparams::basepath}/cacgios",
        path => "${baseconf::globalparams::binpath}",
        require => Class[ "cacgios::preinstall" ],
    }
}

