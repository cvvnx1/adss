# Sample Usage:
#  httpd::config::proxy{ 'www.test.com':
#    vhost_id          => '1',              # {Optional for first vhost)
#    server_name        => 'www.test.com',
#    proxy_type         => 'ajp',            # ajp(ftp|http|connect feature on future)
#    host_name          => [ "node1.test.com", "node2.test.com", "node3.test.com" ],
#    port_name          => [ "8009", "8009", "8009" ],
#    ajp_loadfactor     => [ "1", "1", "1" ],
#    ajp_route          => [ "node1", "node2", "node3" ],
#    ajp_wwwroot        => '/',              # (Optional)
#    ajp_balancer       => 'adss',           # (Optional)
#    ajp_stickysession  => 'jsessionid',     # (Optional)
#    ajp_onfailove      => 'On',             # (Optional)
#  }
define httpd::config::proxy(
    $vhost_id          = '1',
    $server_name        = undef,
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
    include baseconf::globalparams

    # step control
    Class["httpd::config::conf"] -> File["vhost_proxy_file_${vhost_id}"] -> File["proxy_file"]
    File["vhost_proxy_file_${vhost_id}"] ~> Class["httpd::service::control"]

    # resource template declare
    File {
        owner   => "${httpd::daemon_user}",
        group   => "${httpd::daemon_group}",
        mode    => '0644'
    }

    # resources declare
    file { "vhost_proxy_file_${vhost_id}":
        ensure  => present,
        content => template('httpd/vhost/vhost_proxy.conf.erb'),
        path    => "${httpd::temp_dir}/vhost_${server_name}_${vhost_id}50.conf",
    }
}

