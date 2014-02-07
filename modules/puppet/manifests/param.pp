class puppet::param {
    case $::operatingsystem {
        Centos: {
            $confpath = '/etc/sysconfig/puppet'
        }
    }
}
