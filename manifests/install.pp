class jamfpro::install {

require jamfpro

  user { $jamfpro::user:
    comment          => 'jamfpro daemon account',
    shell            => '/bin/false',
    home             => $jira::homedir,
    password         => '*',
    managehome       => true,
  } ->

  file { '${jamfpro::tomcatdir}/webapps/ROOT.war':
    content => template('jamfpro/files/ROOT.war'),
    mode    => '0644',
    owner => $jamfpro::user,
    group => $jamfpro::group,
  }

  exec { 'mkdir ROOT && /usr/bin/unzip ROOT.war -d ./ROOT':
    cwd 	=> '${tomcatdir}/webapps/'
    creates => '${tomcatdir}/webapps/ROOT',
  }
}
