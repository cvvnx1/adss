############################
# Adss base section        #
############################
# class linux_base {
#     include baseconf
# }

############################
# Mysql node sample        #
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
