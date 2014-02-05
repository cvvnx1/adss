class ssh::params {

     =  ? {
        'solaris' => 'openssh',
        'centos' => 'openssh-server',
        'redhat' => 'openssh-server',
        'fedora' => 'openssh-server',
        'debian' => 'openssh-server'
    }

     =  ? {
        'solaris' => '/etc/ssh/sshd_config',
        'centos' => '/etc/ssh/sshd_config',
        'redhat' => '/etc/ssh/sshd_config',
        'fedora' => '/etc/ssh/sshd_config',
        'debian' => '/etc/ssh/sshd_config'
    }

     =  ? {
        'solaris' => 'sshd',
        'centos' => 'sshd',
        'redhat' => 'sshd',
        'fedora' => 'sshd',
        'debian' => 'sshd'
    }
}
