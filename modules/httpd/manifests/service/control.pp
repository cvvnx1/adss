class httpd::service::control {

    include baseconf::globalparams, httpd::params

    # step control
    Class["httpd::install::post"] -> Service["httpd"]
    Class["httpd::config::initrc"] ~> Service["httpd"]
    Exec["rebuild_vhost_file"] ~> Service["httpd"]

    # resources declare
    exec { "rebuild_vhost_file":
        command     => "/bin/cat ${httpd::params::temp_dir}/* > ${httpd::params::confd_dir}/vhost.conf",
        path        => "${baseconf::globalparams::binpath}",
        refreshonly => true,
        subscribe   => File["${httpd::params::temp_dir}"],
    }

    service { "httpd":
        ensure     => running,
        enable     => true,
        hasstatus  => true,
        hasrestart => true,
    }
}
