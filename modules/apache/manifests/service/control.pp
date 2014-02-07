class apache::service::control {

    include apache::params

    # step control
    Class["apache::config::initrc"] -> Service["httpd"]
    Class["apache::config::conf"] ~> Service["httpd"]
    Class["apache::config::initrc"] ~> Service["httpd"]
    Exec["rebuild_vhost_file"] ~> Service["httpd"]
#    Class["apache::config::vhost"] ~> Service["httpd"]

    # resources declare
    exec { "rebuild_vhost_file":
        command     => "/bin/cat ${apache::params::temp_dir}/* > ${apache::params::conf_dir}/conf.d/vhost_${apache::params::server_name}.conf",
        refreshonly => true,
        subscribe   => File["${apache::params::temp_dir}"],
    }

    service { "httpd":
        ensure     => running,
        enable     => true,
        hasstatus  => true,
        hasrestart => true,
    }
}
