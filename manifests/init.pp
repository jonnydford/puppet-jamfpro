class jamfpro (

  # Jamf Pro Settings
  $version      = '9.99.0',
  $product      = 'JSSInstallation',
  $format       = '.zip',
  $installdir   = '/usr/local/',
  $tomcatdir	= '/usr/local/jss/tomcat',
  $homedir      = '/usr/local/jss',
  $user         = 'jamftomcat',
  $group        = 'jamftomcat',

  # Database Settings
  $dbuser       = 'dbusername',
  $dbpassword   = 'mypassword',
  $dbserver     = 'localhost',
  $dbname       = 'jamfsoftware',
  $dbport       = '3306',
  $dbtype       = 'mysql',
  $minpoolsize  = '5',
  $maxpoolsize  = '150',

  # JVM Settings
  $javahome	= '',
  $jvm_xms	= '256m',
  $jvm_xmx      = '2048m',
  $jvm_optional = '',

  # server.xml
  $keystoreDir  = '',
  $keystoreFile = '',
  $keystorePass = '',
  $keyAlias 	= '',

  # Logs
  $logDir	= '/usr/local/jss/logs/',

) {

  include jamfpro::prereqs
  include jamfpro::install
  include jamfpro::config
  include jamfpro::firewall

Class["jamfpro::prereqs"] -> Class["jamfpro::install"] -> Class["jamfpro::config"] -> Class["jamfpro::firewall"]

}

