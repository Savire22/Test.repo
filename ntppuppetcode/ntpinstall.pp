class ntpinstall  {
  $pkg = 'ntp'
  $config = '/etc/ntp.conf'
  $servicename = 'ntpd'
  $dirft = '/var/tmp/ntp/dirft'

  package { "$pkg":
   ensure => installed,
}

  file { "$config":
   ensure => 'file',
   owner => 'root',
   mode => '644',
   group => 'root',
   content => template('/root/ntppuppetcode/ntp.conf.erb'),
   require => Package["$pkg"]
}

  service { "$servicename":
   ensure => 'running',
   enable => 'true',
   require => File["$config"]

}  


}
include ntpinstall


