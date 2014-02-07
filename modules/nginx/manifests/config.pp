class nginx::config {

    include nginx::params

    File {
        owner => 'root',
        group => 'root',
        mode  => '0644'
    }

    file { "${nginx::params::nx_conf_dir}":
        ensure => directory,
        require => Class[ "nginx::install" ],
    }

    file { "${nginx::params::nx_conf_dir}/conf.d":
        ensure => directory,
        require => Class[ "nginx::install" ],
    }

    file { "${nginx::params::nx_run_dir}":
        ensure => directory,
        require => Class[ "nginx::install" ],
    }

    file { "${nginx::params::nx_client_body_temp_path}":
        ensure => directory,
#        owner  => ${nginx::params::nx_daemon_user},
        require => Class[ "nginx::install" ],
    }

    file { "${nginx::params::nx_proxy_temp_path}":
        ensure => directory,
        owner  => "${nginx::params::nx_daemon_user}",
        require => Class[ "nginx::install" ],
    }

    file { "${nginx::params::nx_logdir}":
        ensure => directory,
        owner  => "${nginx::params::nx_daemon_user}",
        require => Class[ "nginx::install" ],
    }

#    file { '${nginx::params::nx_conf_dir}/sites-enabled/default':
#        ensure => absent,
#    }

    file { "${nginx::params::nx_conf_dir}/nginx.conf":
        ensure  => file,
        content => template('nginx/nginx.conf.erb'),
        require => Class[ "nginx::install" ],
    }

    file { "${nginx::params::nx_conf_dir}/conf.d/proxy.conf":
        ensure  => file,
        content => template('nginx/conf.d/proxy.conf.erb'),
        require => Class[ "nginx::install" ],
    }

    file { "${nginx::params::nx_temp_dir}/nginx.d":
        ensure  => directory,
        purge   => true,
        recurse => true,
        require => Class[ "nginx::install" ],
    }
}
