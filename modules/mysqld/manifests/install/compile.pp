class mysqld::install::compile {

    include baseconf::globalparams, mysqld::params

    # step control
    Class["mysqld::install::prepare"] -> Exec ["install_script"]

    # resources declare
    exec { "install_script":
        cwd      => "${baseconf::globalparams::basepath}/mysqld",
        command  => "${baseconf::globalparams::basepath}/mysqld/setup.sh",
        path     => "${baseconf::globalparams::binpath}",
        timeout  => 900,
    }
}
