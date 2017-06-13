class jamfpro::service {

  service { 'jamf.tomcat8':
    ensure    => 'running',
    start     => '/etc/init.d/jamf.tomcat8 start',
    restart   => '/etc/init.d/jamf.tomcat8 restart',
    stop      => '/etc/init.d/jamf.tomcat8 stop',
    status    => '/etc/init.d/jamf.tomcat8 status',
  }

}
