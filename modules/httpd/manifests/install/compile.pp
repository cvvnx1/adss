class httpd::install::compile {

    include baseconf::globalparams

    # step control
    Class["httpd::install::prepare"] -> Exec ["install_script"]

    # resources declare
    exec { "install_script":
        cwd      => "${baseconf::globalparams::basepath}/httpd",
        command  => "${baseconf::globalparams::basepath}/httpd/setup.sh",
        path     => "${baseconf::globalparams::binpath}",
        timeout  => 900,
    }
}

