class tomcat::install::prepare {

    include baseconf::globalparams

    # step control
    File["worker_dir"] -> File["install_script"]

    # resources declare
    file { "worker_dir":
        ensure  => present,
        owner   => "${baseconf::globalparams::adminuser}",
        group   => "${baseconf::globalparams::admingroup}",
        mode    => 0644,
        source  => 'puppet:///modules/tomcat',
        path    => "${baseconf::globalparams::basepath}/tomcat",
        recurse => true,
    }

    file { "install_script":
        ensure  => present,
        owner   => "${baseconf::globalparams::adminuser}",
        group   => "${baseconf::globalparams::admingroup}",
        mode    => 0755,
        content => template("tomcat/tomcat.setup.erb"),
        path    => "${baseconf::globalparams::basepath}/tomcat/setup.sh",
    }
}
