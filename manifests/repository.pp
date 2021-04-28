# @summary
# Inititate a borgmatic repository
#
define borgmatic::repository (
  String $repo,
  Optional[String] $passphrase,
  Optional[Boolean] $use_encryption,
  Optional[Boolean] $use_authentication,
  Optional[Enum['repokey', 'keyfile', 'repokey-blake2', 'keyfile-blake2']] $encryptions,
  Optional[Enum['authenticated', 'authenticated-blake2']] $authentications
) {

  contain borgmatic::config

  if $repo == undef {
    fail("A name is needed to initiate a borg repository.")
  }

  $path = "${$borgmatic::base_path}/borgmatic_${repo}"

  if ($use_authentication == false and $use_encryption == true) {
    $use_authentication = true
  }

  if ($use_encryption and $use_authentication) {
    if $passphrase == undef {
      fail("A passphrase is needed to initiate a borg repository with authentication and encryption.")
    }
    exec { "create ${repo} borg repository":
      command     => "borg init --encryption ${encryptions} ${path}",
      environment => "BORG_PASSPHRASE=${passphrase}",
      require     => Package['borgbackup'],
    }
  } elsif ($use_authentication) {
    if $passphrase == undef {
      fail("A passphrase is needed to initiate a borg repository with authentication.")
    }
    exec { "create ${repo} borg repository":
      command     => "borg init --encryption ${authentications} ${path}",
      environment => "BORG_PASSPHRASE=${passphrase}",
      require     => Package['borgbackup'],
    }
  } else {
    exec { "create ${repo} borg repository":
    command     => "borg init --encryption none ${path}",
      require     => Package['borgbackup'],
    }
  }
}
