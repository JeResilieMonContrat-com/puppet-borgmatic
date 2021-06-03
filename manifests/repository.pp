# @summary
# Inititate a borgmatic repository
#
define borgmatic::repository (
  String $repo                                                                                                                    = undef,
  Optional[String] $backup_user                                                                                                   = 'root',
  Optional[Boolean] $configure_ssh                                                                                                = false,
  Optional[String] $ssh_file_path                                                                                                 = undef,
  Optional[String] $ssh_public_key                                                                                                = undef,
  Optional[String] $ssh_command                                                                                                   = undef,
  Optional[String] $passphrase                                                                                                    = undef,
  Optional[Enum['authenticated', 'authenticated-blake2', 'repokey', 'keyfile', 'repokey-blake2', 'keyfile-blake2']] $encryptions  = undef,
) {

  contain borgmatic::config

  if $repo == undef {
    fail('A name is needed to initiate a borg repository.')
  } else {
    $path = "${$borgmatic::base_path}/borgmatic_${repo}"
  }

  if ($configure_ssh) {
    borgmatic::ssh { $repo:
      ssh_file_path  => $ssh_file_path,
      command        => $ssh_command,
      backup_path    => $borgmatic::base_path,
      client         => $repo,
      ssh_public_key => $ssh_public_key
    }
  }

  if ($encryptions == undef) {
    $encryptions = 'none'
    $environment = ''
  } else {
    $environment = "BORG_PASSPHRASE='${passphrase}'"
  }

  if ($encryptions != 'none' and $passphrase == undef) {
    fail('A passphrase is needed to initiate a borg repository with encryption.')
  }

  exec { "create ${repo} borg repository":
    command     => "sudo -u ${backup_user} ${environment} borg init --encryption=${encryptions} ${path}",
    unless      => "ls ${path}",
    require     => Package['borgmatic']
  }
}
