class squid::params {

    ############################
    # install parameters       #
    ############################
    $version        = 'Server version: Apache/2.2.25 (Unix)'

    $compile_pkg    = 'httpd-2.2.25.tar.gz'

    $prefix_dir     = '/usr/local/squid'
    $conf_dir       = '/usr/local/squid/etc'

    $data_dir       = '/opt/www'

    $temp_dir       = '/tmp/squid'
    $log_dir        = $kernel ? {
        /(?i-mx:linux)/       => '/var/log/squid',
        default               => '/var/log/squid',
        }
    $pid_dir        = $kernel ? {
        /(?i-mx:Linux)/       => '/var/run/httpd',
        default               => '/var/run/httpd',
        }

    $cache_dir                   = '/opt/squid'

    $daemon_user    = $operatingsystem ? {
        /(?i-mx:CentOS|Suse)/ => 'squid',
        default               => 'squid',
        }

    $ulimit_dir     = $operatingsystem ? {
        /(?i-mx:CentOS)/ => '/etc/security/limits.d',
        }

    $compile_opt    = '--with-filedescriptors=${max_file} \
                       --enable-removal-policies=heap,lru \
                       --enable-icmp'

    ############################
    # config parameters        #
    ############################
    $max_file                    = 32768

    $http_port                   = '3128 8080'



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

