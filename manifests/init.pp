# @summary
# Installs and configure Borgmatic overlay for Borg on Debian systems
#
# When this class is declared with the default options, Puppet:
# - Installs the appropriate Borg and Borgmatic software package for Debian.
#
# @example
#   include borgmatic
class borgmatic (
  $base_path          = '/mnt/backup',
  $backup_user        = 'root',
  $backup_group       = 'root',
  $backup_permissions = '0750',
) {
  contain borgmatic::install
  # contain borgmatic::service
}
