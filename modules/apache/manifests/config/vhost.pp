# Sample Usage:
#  apache::config::vhost { 'www.test.com':
#      server_name        => 'www.test.com',
#      server_admin       => 'admin@test.com',
#      www_root           => '/opt/www/www.test.com',
#      errorlog_enable    => 'false',                   # (Optional)
#      accesslog_enable   => 'false',                   # (Optional)
#  }
define apache::config::vhost(
    $server_name        = undef,
    $server_admin       = undef,
    $www_root           = undef,
    $errorlog_enable    = false,
    $accesslog_enable   = false,
) {

    include baseconf::globalparams, apache::params

    # step control
    Class["apache::config::conf"] -> File["vhost_header_file"] -> File["vhost_footer_file"]
    File["vhost_footer_file"] -> File["vhost_dir"] ~> Class["apache::service::control"]

    # resources declare
    file { "vhost_header_file":
        ensure  => present,
        owner   => "${baseconf::globalparams::adminuser}",
        group   => "${baseconf::globalparams::admingroup}",
        mode    => 0644,
        content => template('apache/vhost/vhost_header.conf.erb'),
        path    => "${apache::params::temp_dir}/vhost_${server_name}_001.conf",
    }

    file { "vhost_footer_file":
        ensure  => present,
        owner   => "${baseconf::globalparams::adminuser}",
        group   => "${baseconf::globalparams::admingroup}",
        mode    => 0644,
        content => template('apache/vhost/vhost_footer.conf.erb'),
        path    => "${apache::params::temp_dir}/vhost_${server_name}_999.conf",
    }

    if ($www_root) {
        file { "vhost_dir":
            ensure  => directory,
            owner   => "${baseconf::globalparams::adminuser}",
            group   => "${baseconf::globalparams::admingroup}",
            mode    => 0755,
            path    => "${www_root}",
        }
    }
}
