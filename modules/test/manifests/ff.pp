class test::ff {

include apache::params

$tta = 't \
        abcd \
        d '

    notify { "test2":
        message => "${tta}",
    }

#    notify { "test1":
#        message => 'this is test1',
#    }

#    notify { "test3":
#        message => 'this is test3',
#    }

    file { "/opt/test":
    ensure => present,
owner => 'root',
group => 'root',
mode => 0755,
        content => template('test/test.erb'),
    }

#Notify["test2"] -> Notify["test3"] <- Notify["test1"]
#Notify["test1"] -> Notify["test2"]
#Notify["test1"] -> Class["test::ee"]
}

