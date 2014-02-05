class linux_base {
#    include ssh
#    include puppet
#    include ntpdate
#    include test
    include baseconf
}

node 't1.mhszdomain.com' {
    include linux_base
    include apache
    apache::config::vhost { "t1.mhszdomain.com":
        server_name => 't1.mhszdomain.com',
        server_admin => 'admin@test.com',
        www_root => '/opt/www/t1.mhszdomain.com',
        errorlog_enable => 'true',
        accesslog_enable => 'true',
    }
    apache::config::proxy { "t1.mhszdomain.com":
        proxy_type => 'ajp',
        host_name => ["t2.mhszdomain.com","t3.mhszdomain.com"],
        port_name => ["8009","8009"],
        ajp_loadfactor => ["1","1"],
        ajp_route => ["t2","t3"],
    }
}

node 't2.mhszdomain.com' {
    include linux_base
    include tomcat
    tomcat::config::conf { "t2.mhszdomain.com":
        http_port      => '8080',
        ajp_port       => '8009',
        jvm_route      => 't2',
        redirect_port  => '8443',
    }
}

node 't3.mhszdomain.com' {
    include linux_base
    include tomcat
    tomcat::config::conf { "t3.mhszdomain.com":
        http_port      => '8080',
        ajp_port       => '8009',
        jvm_route      => 't3',
        redirect_port  => '8443',
    } 
}

node 't4.mhszdomain.com' {
    include linux_base
}

node 'mysqltest.mhszdomain.com' {
    include linux_base
    include nginx
#    include mysql
}

node 'imaging.mhszdomain.com' {
    include linux_base
    include apache
    apache::config::vhost { "www.test.com":
        server_name => 'www.test.com',
        server_admin => 'admin@test.com',
        www_root => '/opt/www/www.test.com',
        errorlog_enable => 'true',
        accesslog_enable => 'true',
    }

    include test
#    include nginx
#    nginx::resource::vhost { 'www.cvvnx1.com':
#        ensure => present,
#        www_root => '/opt/www/www.cvvnx1.com',
#    }
#    nginx::resource::vhost { 'www.io.com':
#        ensure => present,
#        www_root => '/opt/www/www.io.com',
#    }

#    include mysqld
#    mysqld::resource::role { "master": }

#    include proftpd
#    proftpd::resource::mysql { "imaging":
#        mysqlhost => 'imaging.mhszdomain.com',
#    }
#    proftpd::resource::quota { "imaging": }

#    include cacgios
}

node 'imagingb.mhszdomain.com' {
    include linux_base
#    include proftpd
#    proftpd::resource::mysql { "imagingb.mhszdomain.com":
#        mysqlhost => 'imaging.mhszdomain.com',
#    }
#    proftpd::resource::quota { "imagingb.mhszdomain.com": }

#    include cacgios
#    include test

}

node 'mysqlbase.mhszdomain.com' {
    include linux_base
    include mysqld
    mysqld::resource::role { "mysqlbase.mhszdomain.com": }
}

node 'most.mhszdomain.com' {
    include linux_base
    include cacgios
}
