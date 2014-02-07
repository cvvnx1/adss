class apache::install::compile {

    include baseconf::globalparams, apache::params

    # step control
    Class["apache::install::prepare"] -> Exec ["install_script"]

    # resources declare
    exec { "install_script":
        cwd      => "${baseconf::globalparams::basepath}/httpd",
        command  => "${baseconf::globalparams::basepath}/httpd/setup.sh",
        path     => "${baseconf::globalparams::binpath}",
    }
}
