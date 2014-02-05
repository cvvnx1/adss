class tomcat::install::compile {

    include baseconf::globalparams, tomcat::params

    # step control
    Class["tomcat::install::prepare"] -> Exec ["install_script"]

    # resources declare
    exec { "install_script":
        cwd      => "${baseconf::globalparams::basepath}/tomcat",
        command  => "${baseconf::globalparams::basepath}/tomcat/setup.sh",
        path     => "${baseconf::globalparams::binpath}",
    }
}
