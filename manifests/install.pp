class jamfpro::install {

  file { '${jamfpro::tomcatdir}/webapps/ROOT.war':
    content => template('jamfpro/files/ROOT.war'),
    mode    => '0644',
    owner => $jamfpro::user,
    group => $jamfpro::group,
  }

exec {'unzip-rootwar':
    cwd 	=> '${tomcatdir}/webapps/'
    command 	=> 'if [ -d "ROOT" ]; then mv ROOT ${jamfpro::version}upgrade.bak && mkdir ROOT && /usr/bin/unzip ROOT.war -d ./ROOT; else mkdir ROOT && /usr/bin/unzip ROOT.war -d ./ROOT; fi'
     }
}
