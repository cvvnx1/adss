class ntpdate::package {
    package { $ntpdate::param::packagename :
        ensure => present,
    }
}
