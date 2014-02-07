define test::ee(
    $host_name  = undef,
) {

file { "/opt/test":
    ensure => present,
    mode   => 0644,
    content => template('test/test.erb'),
}


}
