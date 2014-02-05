class tomcat::params {

    ############################
    # install parameters       #
    ############################

    $java_pkg       = 'jre-6u25-linux-x64.bin'
    $java_pkg_dir   = 'jre1.6.0_25'
    $jave_home      = '/usr/local/java'

    $pkg            = 'apache-tomcat-7.0.42.tar.gz'
    $prefix_dir     = '/usr/local/tomcat'
    $conf_dir       = '/usr/local/tomcat/conf'

    $mysql_conn_pkg = 'mysql-connector-java-5.1.26-bin.jar'

    ############################
    # config parameters        #
    ############################
}

