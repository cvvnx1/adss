# Sample Usage:
#  apache::config::proxy{ 'www.test.com':
#    proxy_type         => 'ajp',            # ajp(ftp|http|connect feature on future)
#    host_name          => [ "node1.test.com", "node2.test.com", "node3.test.com" ],
#    port_name          => [ "8009", "8009", "8009" ],
#    ajp_loadfactor     => [ "1", "1", "1" ],
#    ajp_route          => [ "node1", "node2", "node3"],
#    ajp_wwwroot        => '/',              # (Optional)
#    ajp_balancer       => 'adss',           # (Optional)
#    ajp_stickysession  => 'jsessionid',     # (Optional)
#    ajp_onfailove      => 'On',             # (Optional)
#  }
define apache::config::proxy(
    $proxy_type         = undef,
    $host_name          = undef,
    $port_name          = undef,
    $ajp_loadfactor     = undef,
    $ajp_route          = undef,
    $ajp_wwwroot        = '/',
    $ajp_balancer       = 'adss',
    $ajp_stickysession  = 'jsessionid',
    $ajp_onfailove      = 'On',
) {

    include baseconf::globalparams, apache::params

    # step control
    Class["apache::config::conf"] -> File["proxy_file"]
    File["proxy_file"] ~> Class["apache::service::control"]

    # resources declare
    file { "proxy_file":
        ensure  => present,
        owner   => "${baseconf::globalparams::adminuser}",
        group   => "${baseconf::globalparams::admingroup}",
        mode    => 0644,
        content => template('apache/proxy.conf.erb'),
        path    => "${apache::params::conf_dir}/conf.d/proxy.conf",
    }

    file { "vhost_proxy_file":
        ensure  => present,
        owner   => "${baseconf::globalparams::adminuser}",
        group   => "${baseconf::globalparams::admingroup}",
        mode    => 0644,
        content => template('apache/vhost/vhost_proxy.conf.erb'),
        path    => "${apache::params::temp_dir}/vhost_${apache::params::server_name}_200.conf",
    }
}
