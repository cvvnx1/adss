class httpd::config::initrc {

    include baseconf::globalparams

    # step control
    Class["httpd::config::conf"] -> File["initrc_file"]
    File["initrc_file"] ~> Class["httpd::service::control"]

    # resource template declare
    File {
        owner   => "${baseconf::globalparams::adminuser}",
        group   => "${baseconf::globalparams::admingroup}",
        mode    => '0644'
    }

    # resources declare
    file { "initrc_file":
        ensure  => present,
        owner   => "${baseconf::globalparams::adminuser}",
        group   => "${baseconf::globalparams::admingroup}",
        mode    => 0755,
        content => template('httpd/httpd.init.erb'),
        path    => "${baseconf::globalparams::initrcpath}/httpd",
    }
}
