# @summary
# Creates basic configuration for borgmatic
#
# @example
#   include borgmatic::config
class borgmatic::config {

  if $borgmatic::base_path == undef {
    fail("A base path is needed to initiate a borg repository.")
  }

  file { $borgmatic::base_path:
    ensure  => 'directory',
    mode    => $borgmatic::backup_permissions,
    owner   => $borgmatic::backup_user,
    group   => $borgmatic::backup_group,
  }
}
