class puppet_client{

    file{ 'puppet.client.conf':
        path => '/etc/puppet/puppet.conf',
        source => 'puppet:///system/puppet.client.conf',
    }

    exec{ 'reload-puppet-client':
        command => '/etc/init.d/puppet force-reload',
        require => Service['refresh_puppet_client_config'],
        refreshonly => true,
    }

    service{ 'refresh_puppet_client_config':
        name => 'puppet',
        enable => true,
        ensure => running,
        hasrestart => true,
        hasstatus => true,
        subscribe => File['puppet.client.conf'],
    }
}

