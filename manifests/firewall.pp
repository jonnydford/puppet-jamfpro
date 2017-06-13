class jamfpro:firewall {

include ufw

ufw::allow { "allow-mysql-from-mysql":
  ip => '<%= scope.lookupvar('jamfpro::dbserver') %>'
  port => 3306,
}

ufw::allow { "allow-ssh-from-all":
  port => 22,
}

ufw::allow { "allow-http-from-all":
  port => 80,
}

ufw::allow { "allow-https-alt-from-all":
  port => 8443,
}

ufw::allow { "allow-ntp-from-all":
  port => 123,
}

ufw::allow { "allow-smtp-from-all":
  port => 25,
}

ufw::allow { "allow-https-from-all":
  port => 443,
}

ufw::allow { "allow-http-alt-from-all":
  port => 8080,
}

# Apple Push Notification Service
ufw::allow { "allow-apns1-from-all":
  port => 2195,
}

# Apple Push Notification Service
ufw::allow { "allow-apns2-from-all":
  port => 2196,
}

# Apple Push Notification Service
ufw::allow { "allow-apns3-from-all":
  port => 5223,
}

# Google Cloud Messaging
ufw::allow { "allow-gcm-from-all":
  port => 5228,
}

ufw::allow { "allow-ldap-from-all":
  port => 389,
}

ufw::allow { "allow-ldaps-from-all":
  port => 636,
}

}
