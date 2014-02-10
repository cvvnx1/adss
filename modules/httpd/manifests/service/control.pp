class httpd::service::control {

    include baseconf::globalparams

    # step control
    Class["httpd::config::initrc"] ~> Service["httpd"]
    Class["httpd::config::conf"] ~> Service["httpd"]
    Exec["rebuild_vhost_file"] ~> Service["httpd"]

    # resources declare
    exec { "rebuild_vhost_file":
        command     => "cat ${httpd::temp_dir}/vhost_* > ${httpd::confd_dir}/vhost.conf",
        path        => "${baseconf::globalparams::binpath}",
        refreshonly => true,
        subscribe   => File["${httpd::temp_dir}"],
    }

    exec { "rebuild_base_file":
        command     => "cat ${httpd::temp_dir}/base_* > ${httpd::confd_dir}/base.conf",
        path        => "${baseconf::globalparams::binpath}",
        refreshonly => true,
        subscribe   => File["${httpd::temp_dir}"],
    }

    service { "httpd":
        ensure      => running,
        enable      => true,
        hasstatus   => true,
        hasrestart  => true,
    }
}
