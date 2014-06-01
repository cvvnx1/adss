############################
# Adss base section        #
############################
# class linux_base {
#     include baseconf
# }

############################
# Mysqld node sample       #
############################
# node 'mysql.cvvnx1.com' {
#     include linux_base
#     include mysqld
#--------------------------- Option A
#     mysqld::config::conf { 'mysql.test.com':
#         port                        => '3306',        # (Optional)
#         key_buffer_size             => '16M',         # (Optional)
#         max_allowed_packet          => '1M',          # (Optional)
#         table_open_cache            => '64',          # (Optional)
#         sort_buffer_size            => '512K',        # (Optional)
#         net_buffer_length           => '8K',          # (Optional)
#         read_buffer_size            => '256K',        # (Optional)
#         read_rnd_buffer_size        => '512K',        # (Optional)
#         myisam_sort_buffer_size     => '8M',          # (Optional)
#         max_allowed_packet          => '16M',         # (Optional)
#         key_buffer_size             => '20M',         # (Optional)
#         sort_buffer_size            => '20M',         # (Optional)
#         read_buffer                 => '2M',          # (Optional)
#         write_buffer                => '2M',          # (Optional)
#     }
#     mysqld::config::rep { 'mysql.test.com':           # (Optional)
#         server_id        => '1',                      # (Optional)
#         master_host      => 'master.test.com',
#         master_user      => 'rep',
#         master_psw       => 'rep',
#         master_port      => '3306',                   # (Optional)
#     }
#--------------------------- Option B
#     mysqld::config::conf { 'mysql.test.com':
#     }
#---------------------------
# }

############################
# Httpd node sample        #
############################
# node 'httpd.cvvnx1.com' {
#     include linux_base
#     include httpd
#--------------------------- Option A
#     httpd::config::conf { 'httpd.test.com':
#         servertokens                => 'Prod'               # (Optional)
#         listen                      => '80',                # (Optional)
#         serveradmin                 => 'root@localhost',    # (Optional)
#         usecanonicalname            => 'Off',               # (Optional)
#         timeout                     => '60',                # (Optional)
#         keepalive                   => 'Off',               # (Optional)
#         maxkeepaliverequests        => '100',               # (Optional)
#         keepalivetimeout            => '15',                # (Optional)
#         prefork_minspareservers     => '5',                 # (Optional)
#         prefork_maxspareservers     => '20',                # (Optional)
#     ... Read more in modules/htppd/manifests/config/conf.pp ...
#         authn_default_module        => 'yes',               # (Optional)
#         authz_host_module           => 'yes',               # (Optional)
#         authz_user_module           => 'yes',               # (Optional)
#     ... Read more in modules/htppd/manifests/config/conf.pp ...
#     }
#     httpd::config::vhost { 'httpd.test.com':
#         server_id          => '1',                          # (Optional for first vhost)
#         server_name        => 'httpd.test.com',
#         server_admin       => 'httpd@test.com',
#         www_root           => '/opt/www/www.test.com',
#         errorlog_enable    => 'false',                      # (Optional)
#         accesslog_enable   => 'false',                      # (Optional)
#     }
#--------------------------- Option A (with proxy)
#     httpd::config::conf { 'httpd.test.com':
#         servertokens                => 'Prod'               # (Optional)
#         listen                      => '80',                # (Optional)
#         serveradmin                 => 'root@localhost',    # (Optional)
#         usecanonicalname            => 'Off',               # (Optional)
#         timeout                     => '60',                # (Optional)
#         keepalive                   => 'Off',               # (Optional)
#         maxkeepaliverequests        => '100',               # (Optional)
#         keepalivetimeout            => '15',                # (Optional)
#         prefork_minspareservers     => '5',                 # (Optional)
#         prefork_maxspareservers     => '20',                # (Optional)
#     ... Read more in modules/htppd/manifests/config/conf.pp ...
#         authn_default_module        => 'yes',               # (Optional)
#         authz_host_module           => 'yes',               # (Optional)
#         authz_user_module           => 'yes',               # (Optional)
#     ... Read more in modules/htppd/manifests/config/conf.pp ...
#     }
#     httpd::config::vhost { 'httpd.test.com':
#         server_id          => '1',                          # (Optional for first vhost)
#         server_name        => 'httpd.test.com',
#         server_admin       => 'httpd@test.com',
#         www_root           => '/opt/www/www.test.com',
#         errorlog_enable    => 'false',                      # (Optional)
#         accesslog_enable   => 'false',                      # (Optional)
#     }
#     httpd::config::proxy{ 'www.test.com':
#       server_id            => '1',                          # {Optional for first vhost)
#       server_name          => 'httpd.test.com',
#       proxy_type           => 'ajp',                        # ajp(ftp|http|connect feature on future)
#       host_name            => [ "ajp1.test.com", "ajp2.test.com", "ajp3.test.com" ],
#       port_name            => [ "8009", "8009", "8009" ],
#       ajp_loadfactor       => [ "1", "1", "1" ],
#       ajp_route            => [ "ajp1", "ajp2", "ajp3" ],
#       ajp_wwwroot          => '/',                          # (Optional)
#       ajp_balancer         => 'adss',                       # (Optional)
#       ajp_stickysession    => 'jsessionid',                 # (Optional)
#       ajp_onfailove        => 'On',                         # (Optional)
#     }
#--------------------------- Option B
#     httpd::config::conf { 'httpd.test.com':
#         www_root           => '/opt/www',                   # (Optional)
#     }
#     httpd::config::vhost { 'httpda.test.com':
#         server_id          => '1',                          # (Optional for first vhost)
#         server_name        => 'httpda.test.com',
#         server_admin       => 'admin@test.com',
#         www_root           => '/opt/www/httpda.test.com',
#     }
#--------------------------- Option B (with proxy)
#     httpd::config::conf { 'httpd.test.com':
#         www_root           => '/opt/www',                   # (Optional)
#     }
#     httpd::config::vhost { 'httpda.test.com':
#         server_id          => '1',                          # (Optional for first vhost)
#         server_name        => 'httpda.test.com',
#         server_admin       => 'admin@test.com',
#         www_root           => '/opt/www/httpda.test.com',
#     }
#     httpd::config::proxy{ 'www.test.com':
#       server_id            => '1',                          # {Optional for first vhost)
#       server_name          => 'httpda.test.com',
#       proxy_type           => 'ajp',                        # ajp(ftp|http|connect feature on future)
#       host_name            => [ "ajp1.test.com", "ajp2.test.com", "ajp3.test.com" ],
#       port_name            => [ "8009", "8009", "8009" ],
#       ajp_loadfactor       => [ "1", "1", "1" ],
#       ajp_route            => [ "ajp1", "ajp2", "ajp3" ],
#     }
# }