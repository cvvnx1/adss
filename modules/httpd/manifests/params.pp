class httpd::params {

    ############################
    # install parameters       #
    ############################
    $version        = 'httpd-2.2.25'

    $pkg    = 'httpd-2.2.25.tar.gz'

    $prefix_dir     = '/usr/local/httpd'
    $conf_dir       = '/usr/local/httpd/conf'
    $confd_dir      = '/usr/local/httpd/conf/conf.d'

    $temp_dir       = '/usr/local/httpd/tmp'

    $log_dir        = $kernel ? {
        /(?i-mx:linux)/       => '/var/log/httpd',
        default               => '/var/log/httpd',
        }
    $pid_dir        = $kernel ? {
        /(?i-mx:Linux)/       => '/var/run/httpd',
        default               => '/var/run/httpd',
        }

    $daemon_user    = $operatingsystem ? {
        /(?i-mx:CentOS|Suse)/ => 'apache',
        default               => 'apache',
        }
    $daemon_group    = $operatingsystem ? {
        /(?i-mx:CentOS|Suse)/ => 'apache',
        default               => 'apache',
        }

    $compile_opt    = '--with-mpm=prefork \
                       --enable-mods-shared=all \
                       --enable-so --enable-rewrite --enable-deflate \
                       --enable-proxy \
                       --enable-proxy-connect --enable-proxy-ftp --enable-proxy-http \
                       --enable-proxy-scgi --enable-proxy-ajp --enable-proxy-balancer'
}
