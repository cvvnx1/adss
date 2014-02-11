class httpd (
    $prefix_dir     = '/usr/local/httpd',
    $version        = 'httpd-2.2.25',
    $pkg            = 'httpd-2.2.25.tar.gz',
    $log_dir        = $kernel ? {
        /(?i-mx:linux)/       => '/var/log/httpd',
        default               => '/var/log/httpd',
        },
    $pid_dir        = $kernel ? {
        /(?i-mx:Linux)/       => '/var/run/httpd',
        default               => '/var/run/httpd',
        },
    $daemon_user    = $operatingsystem ? {
        /(?i-mx:CentOS|Suse)/ => 'apache',
        default               => 'apache',
        },
    $daemon_group    = $operatingsystem ? {
        /(?i-mx:CentOS|Suse)/ => 'apache',
        default               => 'apache',
        },
) {
    $compile_opt    = '--with-mpm=prefork \
                       --enable-so --enable-rewrite --enable-deflate \
                       --enable-cache --enable-disk-cache --enable-mem-cache \
                       --enable-expires --enable-headers \
                       --enable-proxy \
                       --enable-proxy-connect --enable-proxy-ftp --enable-proxy-http \
                       --enable-proxy-scgi --enable-proxy-ajp --enable-proxy-balancer \
                       --enable-modules=all --enable-mods-shared=all'
    $conf_dir       = "${prefix_dir}/conf"
    $confd_dir      = "${conf_dir}/conf.d"
    $temp_dir       = "${prefix_dir}/tmp"

    include httpd::install::prepare, httpd::install::compile, httpd::install::post
    include httpd::config::initrc
    include httpd::service::control
}

