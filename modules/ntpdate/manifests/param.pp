class ntpdate::param {
    case $::operatingsystem {
        Centos: {
            $packagename = 'ntpdate'
        }
    }
}