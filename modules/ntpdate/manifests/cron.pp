class ntpdate::cron {
    cron { "ntpdate":
        command => "ntpdate 0.asia.pool.ntp.org",
        user => 'root',
        hour => ['0-23'],
        require => Class["ntpdate::package"],
    }
}
