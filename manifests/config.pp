class jamfpro::config {

  file { '${jamfpro::keystoreDir}/${jamfpro::keystoreFile}':
    content => template('jamfpro/files/star_akqa_net.jks'),
    mode    => '0644',
    owner => $jamfpro::user,
    group => $jamfpro::group,
  }

  file { '${jamfpro::tomcatdir}/conf/server.xml':
    content => template('jamfpro/template/server.xml.erb'),
    mode    => '0644',
    owner => $jamfpro::user,
    group => $jamfpro::group,
  }

  file { '${jamfpro::tomcatdir}/webapps/ROOT/WEB-INF/xml/DataBase.xml':
    content => template('jamfpro/template/DataBase.xml.erb'),
    mode    => '0644',
    owner => $jamfpro::user,
    group => $jamfpro::group,
  }
  
  file { '${jamfpro::tomcatdir}/webapps/ROOT/WEB-INF/classes/log4j.properties':
    content => template('jamfpro/template/log4j.properties.erb'),
    mode    => '0644',
    owner => $jamfpro::user,
    group => $jamfpro::group,
  }

}
