# @summary
# Creates ssh configuration to allow communication between server and client
#
define borgmatic::ssh (
  $ssh_file_path,
  $command,
  $backup_path,
  $client,
  $ssh_public_key
){
  file_line { $title:
    ensure => present,
    path   => $ssh_file_path,
    line   => "command=\"${command} ${backup_path}/borgmatic_${client}\",restrict ${ssh_public_key}",
    match  => "$ssh_public_key\$"
  }
}
