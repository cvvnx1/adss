class named::install::compile {

    include baseconf::globalparams, named::params

    # step control
    Class["named::install::prepare"] -> Exec ["install_script"]

    # resources declare
    exec { "install_script":
        cwd      => "${baseconf::globalparams::basepath}/named",
        command  => "${baseconf::globalparams::basepath}/named/setup.sh",
        path     => "${baseconf::globalparams::binpath}",
    }
}
