# @summary
# Inititate a borgmatic repository
#
define borgmatic::repository (
  String $repo                                                                                                                    = undef,
  Optional[String] $passphrase                                                                                                    = undef,
  Optional[Enum['authenticated', 'authenticated-blake2', 'repokey', 'keyfile', 'repokey-blake2', 'keyfile-blake2']] $encryptions  = undef,
) {

  contain borgmatic::config

  if $repo == undef {
    fail("A name is needed to initiate a borg repository.")
  }

  $path = "${$borgmatic::base_path}/borgmatic_${repo}"

  if ($encryptions == undef) {
    $encryptions = 'none'
    $environment = ''
  } else {
    $environment = "BORG_PASSPHRASE=${passphrase}"
  }

  if ($encryptions != 'none' and $passphrase == undef) {
    fail("A passphrase is needed to initiate a borg repository with encryption.")
  }

  exec { "create ${repo} borg repository":
    command     => "borg init --encryption ${encryptions} ${path}",
    environment => $environment,
    require     => Package['borgbackup'],
  }
}
