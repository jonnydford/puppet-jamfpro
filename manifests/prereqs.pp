class jamfpro::prereqs {

  exec{'apt-update':
      command => '/usr/bin/apt-get update'
  }

  Exec['apt-update'] -> Package <| |>

  Exec{
    path => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
  }

  package { 'wget':  ensure => 'latest' }
  package { 'curl':  ensure => 'latest' }
  package { 'unzip':  ensure => 'latest' }

  exec { "downloadvmwaretoolsdsa":
     cwd => "/tmp",
     command => "/usr/bin/wget http://packages.vmware.com/tools/keys/VMWARE-PACKAGING-GPG-DSA-KEY.pub && apt-key add /tmp/VMWARE-PACKAGING-GPG-DSA-KEY.pub",
     timeout => 1200,
     refreshonly => true,
  } ->

  exec { "downloadvmwaretoolsrsa":
     cwd => "/tmp",
     command => "/usr/bin/wget http://packages.vmware.com/tools/keys/VMWARE-PACKAGING-GPG-RSA-KEY.pub && apt-key add /tmp/VMWARE-PACKAGING-GPG-RSA-KEY.pub",
     timeout => 1200,
     refreshonly => true,
  } ->

  exec { "java8security":
     cwd => "/tmp",
     command => "/usr/bin/curl -v -j -k -L -H "Cookie:oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jce/8/jce_policy-8.zip && unzip /tmp/jce_policy-8.zip && cp /tmp/UnlimitedJCEPolicyJDK8/* /usr/lib/jvm/java-8-oracle/jre/lib/security",
     timeout => 1200,
     refreshonly => true,
  } ->

  package { 'tomcat8': ensure => 'installed' }
  package { 'ufw': ensure => 'latest' }
  package { 'open-vm-tools':  ensure => 'latest' }
  package { 'unzip':  ensure => 'latest' }

}
