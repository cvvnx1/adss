class proftpd::params {

#    $version                  = 'ProFTPD Version 1.3.4c'
    $version                  = 'ProFTPD Version 1.3.4c'
    $pkg                      = 'proftpd-1.3.4c.tar.gz'

    $run_dir                  = '/var/run/proftpd'
    $prefix_dir               = '/usr/local/proftpd'
    $conf_dir                 = '/usr/local/proftpd/etc'
    $mysql_lib_dir = $operatingsystem ? {
        /(?i-mx:CentOS)/       => '/usr/lib64/mysql',
    }
    $mysql_include_dir = $operatingsystem ? {
        /(?i-mx:CentOS)/       => '/usr/include/mysql',
    }
    $data_dir                 = '/opt/ftp'
    $temp_dir                 = '/usr/local/proftpd/var'
    $log_dir = $kernel ? {
        /(?i-mx:linux)/       => '/var/log/proftpd',
    }
    $pid_dir = $kernel ? {
        /(?i-mx:linux)/       => '/var/run/proftpd',
    }
    $lock_dir = $operatingsystem ? {
        /(?i-mx:CentOS)/       => '/var/lock/subsys',
    }

    $pub_dir                  = '/opt/ftp/pub'

    $daemon_user = $operatingsystem ? {
        /(?i-mx:CentOS|rhel|suse|opensuse)/ => 'ftp',
    }

    $servername                  = 'CQ s FTP Server'
    $port                        = 21
    $passiveports                = '65400 65450'

    $maxinstances                = 50
    $maxclients                  = 20
    $maxclientsperhost           = 10

    $file_umask                  = '0006'
    $directory_umask             = '0007'
    $user                        = 'ftp'
    $group                       = 'ftp'

    $global_defaultroot          = '~'

    $allowoverwrite              = on
    $allowstorerestart           = on
    $allowretrieverestart        = on
    
    $usereversedns               = off
    $identlookups                = off
    
    $timeoutidle                 = 600
    $timeoutlogin                = 300
    $timeoutnotransfer           = 300
    $timeoutstalled              = 3600

    $pub_transferrate_stor       = 300
    $pub_transferrate_quota_stor = 10000000
    $pub_transferrate_retr       = 300
    $pub_transferrate_quota_retr = 10000000
}

