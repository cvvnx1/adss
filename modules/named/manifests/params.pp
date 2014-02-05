class named::params {

    ############################
    # install parameters       #
    ############################
    $prog           = 'named'
    $version        = '9.9.3rc2'

    $compile_pkg    = 'bind-9.9.3rc2.tar.gz'

    $prefix_dir     = '/usr/local/named'
    $conf_dir       = '/usr/local/named/conf'

    $temp_dir       = '/tmp/named'

    $pid_dir        = $kernel ? {
        /(?i-mx:Linux)/       => '/var/run/named',
        default               => '/var/run/named',
        }

    $daemon_user    = $operatingsystem ? {
        /(?i-mx:CentOS|Suse)/ => 'named',
        default               => 'named',
        }

    $compile_prefix = 'LDFLAGS=\"-L/usr/lib64/mysql\" CPPFLAGS=\"-I/usr/include/mysql\"'

    $compile_opt    = '--without-openssl \
                       --with-dlz-mysql=yes'

    ############################
    # config parameters        #
    ############################
    $listen_on                   = 53
    $forwarders                  = ["8.8.8.8","4.4.4.4"]
}
