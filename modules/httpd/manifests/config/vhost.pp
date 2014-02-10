# Sample Usage:
#  httpd::config::vhost { 'www.test.com':
#      vhost_id          => '1',                       # (Optional for first vhost)
#      server_name        => 'www.test.com',
#      server_admin       => 'admin@test.com',
#      www_root           => '/opt/www/www.test.com',
#      errorlog_enable    => 'false',                   # (Optional)
#      accesslog_enable   => 'false',                   # (Optional)
#  }
define httpd::config::vhost (
    $vhost_id          = '1',
    $server_name        = undef,
    $server_admin       = undef,
    $www_root           = undef,
    $errorlog_enable    = false,
    $accesslog_enable   = false,
) {
    include baseconf::globalparams

    # step control
    Class["httpd::config::conf"] -> File["vhost_header_file_${vhost_id}"] -> File["vhost_footer_file_${vhost_id}"] -> File["vhost_dir_${vhost_id}"]
    File["vhost_header_file_${vhost_id}"] ~> Class["httpd::service::control"]

    # resource template declare
    File {
        owner   => "${httpd::daemon_user}",
        group   => "${httpd::daemon_group}",
        mode    => '0644'
    }

    # resources declare
    file { "vhost_header_file_${vhost_id}":
        ensure  => present,
        content => template('httpd/vhost/vhost_header.conf.erb'),
        path    => "${httpd::temp_dir}/vhost_${server_name}_${vhost_id}01.conf",
    }

    if ($www_root) {
        file { "vhost_dir_${vhost_id}":
            ensure  => directory,
            mode    => 0755,
            path    => "${www_root}",
        }
    }

    file { "vhost_footer_file_${vhost_id}":
        ensure  => present,
        content => template('httpd/vhost/vhost_footer.conf.erb'),
        path    => "${httpd::temp_dir}/vhost_${server_name}_${vhost_id}99.conf",
    }
}

