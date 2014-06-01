# Sample Usage:
#  httpd::config::vhost { 'www.test.com':
#      server_id          => '1',                       # (Optional for first vhost)
#      server_name        => 'www.test.com',
#      server_admin       => 'admin@test.com',
#      www_root           => '/opt/www/www.test.com',
#      errorlog_enable    => 'false',                   # (Optional)
#      accesslog_enable   => 'false',                   # (Optional)
#  }
define httpd::config::vhost(
    $server_id          = '1',
    $server_name        = undef,
    $server_admin       = undef,
    $www_root           = undef,
    $errorlog_enable    = false,
    $accesslog_enable   = false,
) {
    include baseconf::globalparams, httpd::params

    # step control
    Class["httpd::install::post"] -> File["vhost_header_file"] -> File["vhost_footer_file"] -> File["vhost_dir"]
    File["vhost_header_file"] ~> Class["httpd::service::control"]

    # resource template declare
    File {
        owner   => "${httpd::params::daemon_user}",
        group   => "${httpd::params::daemon_group}",
        mode    => '0644'
    }

    # resources declare
    file { "vhost_header_file":
        ensure  => present,
        content => template('httpd/vhost/vhost_header.conf.erb'),
        path    => "${httpd::params::temp_dir}/vhost_${server_name}_${server_id}01.conf",
    }

    if ($www_root) {
        file { "vhost_dir":
            ensure  => directory,
            mode    => 0755,
            path    => "${www_root}",
        }
    }

    file { "vhost_footer_file":
        ensure  => present,
        content => template('httpd/vhost/vhost_footer.conf.erb'),
        path    => "${httpd::params::temp_dir}/vhost_${server_name}_${server_id}99.conf",
    }
}
