class apache::params {

    ############################
    # install parameters       #
    ############################
    $version        = 'Server version: Apache/2.2.25 (Unix)'

    $compile_pkg    = 'httpd-2.2.25.tar.gz'

    $prefix_dir     = '/usr/local/httpd'
    $conf_dir       = '/usr/local/httpd/conf'

    $data_dir       = '/opt/www'

    $temp_dir       = '/tmp/httpd'
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

    $compile_opt    = '--with-mpm=prefork \
                       --enable-mods-shared=all \
                       --enable-so --enable-rewrite --enable-deflate \
                       --enable-proxy \
                       --enable-proxy-connect --enable-proxy-ftp --enable-proxy-http \
                       --enable-proxy-scgi --enable-proxy-ajp --enable-proxy-balancer'

    ############################
    # config parameters        #
    ############################
    $timeout                     = 60

    $keepalive                   = 'Off'
    $maxkeepaliverequests        = 100
    $keepalivetimeout            = 15

    $prefork_minspareservers     = 5
    $prefork_maxspareservers     = 20
    $prefork_serverlimit         = 256
    $prefork_maxclients          = 256
    $prefork_maxrequestsperchild = 4000

    $worker_minsparethreads      = 25
    $worker_maxsparethreads      = 75
    $worker_maxclients           = 300
    $worker_threadsperchild      = 25
    $worker_maxeequestsperchild  = 0

    $listen                      = 80
    $serveradmin                 = 'root@localhost'

    $directoryindex              = 'index.html index.html.var index.php'

    $hostnamelookups             = 'Off'
    
    $loglevel                    = 'warn'
    $logformat_combined          = '%h %l %u %t \"%r\" %>s %b \"%{Referer}i\" \"%{User-Agent}i\"'

    $indexignore                 = '.??* *~ *# HEADER* README* RCS CVS *,v *,t'
}

