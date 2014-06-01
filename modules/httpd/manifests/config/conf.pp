# Sample Usage:
#  httpd::config::conf { 'httpd.test.com':
#      servertokens                => 'Prod'               # (Optional)
#      listen                      => '80',                # (Optional)
#      serveradmin                 => 'root@localhost',    # (Optional)
#      usecanonicalname            => 'Off',               # (Optional)
#      www_root                    => '/opt/www',          # (Optional)
#      timeout                     => '60',                # (Optional)
#      keepalive                   => 'Off',               # (Optional)
#      maxkeepaliverequests        => '100',               # (Optional)
#      keepalivetimeout            => '15',                # (Optional)
#      prefork_minspareservers     => '5',                 # (Optional)
#      prefork_maxspareservers     => '20',                # (Optional)
#      prefork_serverlimit         => '256',               # (Optional)
#      prefork_maxclients          => '256',               # (Optional)
#      prefork_maxrequestsperchild => '4000',              # (Optional)
#      worker_minsparethreads      => '25',                # (Optional)
#      worker_maxsparethreads      => '75',                # (Optional)
#      worker_maxclients           => '300',               # (Optional)
#      worker_threadsperchild      => '25',                # (Optional)
#      worker_maxeequestsperchild  => '0',                 # (Optional)
#      directoryindex              => 'index.html index.html.var index.php',
#                                                          # (Optional)
#      indexignore                 => '.??* *~ *# HEADER* README* RCS CVS *,v *,t',
#                                                          # (Optional)
#      hostnamelookups             => 'Off',               # (Optional)
#      serversignature             => 'On',                # (Optional)
#      accesslog                   => 'false',             # (Optional)
#      loglevel_combined           => 'warn',              # (Optional)
#      logformat_combined          => '%h %l %u %t \"%r\" %>s %b \"%{Referer}i\" \"%{User-Agent}i\"',
#                                                          # (Optional)
#      auth_basic_module           => 'yes',               # (Optional)
#      auth_digest_module          => undef,               # (Optional)
#      authn_file_module           => undef,               # (Optional)
#      authn_alias_module          => undef,               # (Optional)
#      authn_anon_module           => undef,               # (Optional)
#      authn_dbm_module            => undef,               # (Optional)
#      authn_default_module        => undef,               # (Optional)
#      authz_host_module           => 'yes',               # (Optional)
#      authz_user_module           => undef,               # (Optional)
#      authz_owner_module          => undef,               # (Optional)
#      authz_groupfile_module      => undef,               # (Optional)
#      authz_dbm_module            => undef,               # (Optional)
#      authz_default_module        => undef,               # (Optional)
#      ldap_module                 => undef,               # (Optional)
#      authnz_ldap_module          => undef,               # (Optional)
#      include_module              => undef,               # (Optional)
#      log_config_module           => 'yes',               # (Optional)
#      logio_module                => undef,               # (Optional)
#      env_module                  => undef,               # (Optional)
#      ext_filter_module           => undef,               # (Optional)
#      mime_magic_module           => undef,               # (Optional)
#      expires_module              => undef,               # (Optional)
#      deflate_module              => undef,               # (Optional)
#      headers_module              => undef,               # (Optional)
#      usertrack_module            => undef,               # (Optional)
#      setenvif_module             => 'yes',               # (Optional)
#      mime_module                 => 'yes',               # (Optional)
#      dav_module                  => undef,               # (Optional)
#      status_module               => undef,               # (Optional)
#      autoindex_module            => 'yes',               # (Optional)
#      info_module                 => undef,               # (Optional)
#      dav_fs_module               => undef,               # (Optional)
#      vhost_alias_module          => undef,               # (Optional)
#      negotiation_module          => 'yes',               # (Optional)
#      dir_module                  => 'yes',               # (Optional)
#      actions_module              => undef,               # (Optional)
#      speling_module              => undef,               # (Optional)
#      userdir_module              => undef,               # (Optional)
#      alias_module                => 'yes',               # (Optional)
#      substitute_module           => undef,               # (Optional)
#      rewrite_module              => undef,               # (Optional)
#      proxy_module                => undef,               # (Optional)
#      proxy_balancer_module       => undef,               # (Optional)
#      proxy_ftp_module            => undef,               # (Optional)
#      proxy_http_module           => undef,               # (Optional)
#      proxy_ajp_module            => undef,               # (Optional)
#      proxy_connect_module        => undef,               # (Optional)
#      cache_module                => undef,               # (Optional)
#      suexec_module               => undef,               # (Optional)
#      disk_cache_module           => undef,               # (Optional)
#      cgi_module                  => undef,               # (Optional)
#      version_module              => undef,               # (Optional)
#  }
define httpd::config::conf (
    $servertokens                = 'Prod',
    $listen                      = '80',
    $serveradmin                 = 'root@localhost',
    $usecanonicalname            = 'Off',

    $www_root                    = '/opt/www',

    $timeout                     = '60',

    $keepalive                   = 'Off',
    $maxkeepaliverequests        = '100',
    $keepalivetimeout            = '15',

    $prefork_minspareservers     = '5',
    $prefork_maxspareservers     = '20',
    $prefork_serverlimit         = '256',
    $prefork_maxclients          = '256',
    $prefork_maxrequestsperchild = '4000',

    $worker_minsparethreads      = '25',
    $worker_maxsparethreads      = '75',
    $worker_maxclients           = '300',
    $worker_threadsperchild      = '25',
    $worker_maxeequestsperchild  = '0',

    $directoryindex              = 'index.html index.html.var index.php',
    $indexignore                 = '.??* *~ *# HEADER* README* RCS CVS *,v *,t',

    $hostnamelookups             = 'Off',
    $serversignature             = 'On',

    $accesslog                   = 'false',
    $loglevel_combined           = 'warn',
    $logformat_combined          = '%h %l %u %t \"%r\" %>s %b \"%{Referer}i\" \"%{User-Agent}i\"',

    $auth_basic_module           = 'yes',
    $auth_digest_module          = undef,
    $authn_file_module           = undef,
    $authn_alias_module          = undef,
    $authn_anon_module           = undef,
    $authn_dbm_module            = undef,
    $authn_default_module        = undef,
    $authz_host_module           = 'yes',
    $authz_user_module           = undef,
    $authz_owner_module          = undef,
    $authz_groupfile_module      = undef,
    $authz_dbm_module            = undef,
    $authz_default_module        = undef,
    $ldap_module                 = undef,
    $authnz_ldap_module          = undef,
    $include_module              = undef,
    $log_config_module           = 'yes',
    $logio_module                = undef,
    $env_module                  = undef,
    $ext_filter_module           = undef,
    $mime_magic_module           = undef,
    $expires_module              = undef,
    $deflate_module              = undef,
    $headers_module              = undef,
    $usertrack_module            = undef,
    $setenvif_module             = 'yes',
    $mime_module                 = 'yes',
    $dav_module                  = undef,
    $status_module               = undef,
    $autoindex_module            = 'yes',
    $info_module                 = undef,
    $dav_fs_module               = undef,
    $vhost_alias_module          = undef,
    $negotiation_module          = 'yes',
    $dir_module                  = 'yes',
    $actions_module              = undef,
    $speling_module              = undef,
    $userdir_module              = undef,
    $alias_module                = 'yes',
    $substitute_module           = undef,
    $rewrite_module              = undef,
    $proxy_module                = undef,
    $proxy_balancer_module       = undef,
    $proxy_ftp_module            = undef,
    $proxy_http_module           = undef,
    $proxy_ajp_module            = undef,
    $proxy_connect_module        = undef,
    $cache_module                = undef,
    $suexec_module               = undef,
    $disk_cache_module           = undef,
    $cgi_module                  = undef,
    $version_module              = undef,
) {
    include httpd::params

    # step control
    Class["httpd::install::post"] -> File["conf_file"]
    File["conf_file"] ~> Class["httpd::service::control"]

    # resource template declare
    File {
        owner   => "${httpd::params::daemon_user}",
        group   => "${httpd::params::daemon_group}",
        mode    => '0644'
    }

    # resources declare
    file { "conf_file":
        ensure  => present,
        content => template('httpd/httpd.conf.erb'),
        path    => "${httpd::params::conf_dir}/httpd.conf",
    }

    file { "www_root":
        ensure  => directory,
        mode    => 0755,
        path    => "${www_root}",
    }
}
