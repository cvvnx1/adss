# Global Parameters
#########################################
# Include in node like this:            #
#    include baseconf                   #
#                                       #
# Used like this:                       #
#    $baseconf::globalparams::basepath  #
#                                       #
#########################################

class baseconf::globalparams {

    $master        = 'puppet.mhszdomain.com'
    $marker        = 'adss_marker'

    $statusfile    = 'adss_status'

    $basepath      = $kernel ? {
        /(?i-mx:Linux)/       => '/etc/adss',
        default               => '/etc/adss',
        }

    $baseconfpath  = $operatingsystem ? {
        /(?i-mx:CentOS)/      => 'puppet:///modules/baseconf/centos',
        }

    $initpath      = $operatingsystem ? {
        /(?i-mx:CentOS)/      => '/etc/rc.d/init.d',
        default               => '/etc/rc.d/init.d',
        }

    $initrcpath    = $operatingsystem ? {
        /(?i-mx:CentOS)/      => '/etc/rc.d/init.d',
        default               => '/etc/rc.d/init.d',
        }

    $binpath       = $operatingsystem ? {
        /(?i-mx:CentOS)/      => '/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin',
        default               => '/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin',
        }

    $envprofile    = $operatingsystem ? {
        /(?i-mx:CentOS)/      => '/etc/profile',
        }

    $adminuser     = $operatingsystem ? {
        /(?i-mx:CentOS)/      => 'root',
        }

    $admingroup    = $operatingsystem ? {
        /(?i-mx:CentOS)/      => 'root',
        }

    $firewallconf  = $operatingsystem ? {
        /(?i-mx:CentOS)/      => '/etc/sysconfig/iptables',
        }

    $firewallserv  = $operatingsystem ? {
        /(?i-mx:CentOS)/      => 'iptables',
        }

    $sshdconf      = $operatingsystem ? {
        /(?i-mx:CentOS)/      => '/etc/ssh/sshd_config',
        }

    $sshdserv      = $operatingsystem ? {
        /(?i-mx:CentOS)/      => 'sshd',
        }

    $sysctlconf    = $operatingsystem ? {
        /(?i-mx:CentOS)/      => '/etc/sysctl.conf',
        }

    $yumserver     = $operatingsystem ? {
        /(?i-mx:CentOS)/      => '10.3.240.20',
        }
}

