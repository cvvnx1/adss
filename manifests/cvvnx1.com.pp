#class linux_base {
#    include baseconf
#}

#node 'ftp.cvvnx1.com' {
#    include linux_base
#    include proftpd
#    proftpd::resource::mysql { "ftp.cvvnx1.com":
#        mysqlhost => 'mysqlbase.mhszdomain.com',
#    }
#    proftpd::resource::quota { "ftp.cvvnx1.com": }
#}
