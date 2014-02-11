class httpd::config::mod::disk_cache_module (
    $cacheenable                 = '/',
    $cacheroot                   = '/tmp/httpd',
    $cachedirlength              = '4',
    $cachedirlevels              = '5',
    $cacheminfilesize            = '64000',
    $cachemaxfilesize            = '64',
) {
    # step control
    Class["httpd::config::conf"] -> File["conf_file_mem_cache_module"]
    File["conf_file_disk_cache_module"] ~> Class["httpd::service::control"]

    # resource template declare
    File {
        owner   => "${httpd::daemon_user}",
        group   => "${httpd::daemon_group}",
        mode    => '0644'
    }

    # resources declare
    file { "dir_disk_cache_module":
        ensure  => directory,
        path    => "${cacheroot}",
    }

    file { "conf_file_disk_cache_module":
        ensure  => present,
        content => template('httpd/mod/disk_cache_module.conf.erb'),
        path    => "${httpd::temp_dir}/base_disk_cache_module.conf",
    }
}

