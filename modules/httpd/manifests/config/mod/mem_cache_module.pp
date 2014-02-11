class httpd::config::mod::mem_cache_module (
    $cacheenable                 = '/',
    $mcachesize                  = '262144',
    $mcachemaxobjectcount        = '60000',
    $mcacheminobjectsize         = '1',
    $mcachemaxobjectsize         = '5120',
    $mcacheremovalalgorithm      = 'GDSF',
    $mcachemaxstreamingbuffer    = '50000',
) {
    # step control
    Class["httpd::config::conf"] -> File["conf_file_mem_cache_module"]
    File["conf_file_mem_cache_module"] ~> Class["httpd::service::control"]

    # resource template declare
    File {
        owner   => "${httpd::daemon_user}",
        group   => "${httpd::daemon_group}",
        mode    => '0644'
    }

    # resources declare
    file { "conf_file_mem_cache_module":
        ensure  => present,
        content => template('httpd/mod/mem_cache_module.conf.erb'),
        path    => "${httpd::temp_dir}/base_mem_cache_module.conf",
    }
}
