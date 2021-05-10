# @summary
# Creates the configuration file for borgmatic
#
define borgmatic::client (
  String $client                                                              = undef,
  Optional[String] $backup_user                                               = undef,
  Optional[String] $config_file_destination                                   = '/etc/borgmatic',
  Optional[String] $config_file_name                                          = 'config.yaml',
  Array $source_directories                                                   = undef,
  Array $backup_servers                                                       = undef,
  Optional[Boolean] $one_file_system                                          = undef,
  Optional[Boolean] $numeric_owner                                            = undef,
  Optional[Boolean] $atime                                                    = undef,
  Optional[Boolean] $ctime                                                    = undef,
  Optional[Boolean] $birthtime                                                = undef,
  Optional[Boolean] $read_special                                             = undef,
  Optional[Boolean] $bsd_flags                                                = undef,
  Optional[String] $files_cache                                               = undef,
  Optional[String] $local_path                                                = undef,
  Optional[String] $remote_path                                               = undef,
  Optional[Array] $patterns                                                   = undef,
  Optional[Array] $patterns_from                                              = undef,
  Optional[Array] $exclude_patterns                                           = undef,
  Optional[Array] $exclude_from                                               = undef,
  Optional[Boolean] $exclude_caches                                           = undef,
  Optional[Array] $exclude_if_present                                         = undef,
  Optional[Boolean] $keep_exclude_tags                                        = undef,
  Optional[Boolean] $exclude_nodump                                           = undef,
  Optional[String] $borgmatic_source_directory                                = undef,
  Optional[String] $encryption_passcommand                                    = undef,
  Optional[String] $encryption_passphrase                                     = undef,
  Optional[Integer] $checkpoint_interval                                      = undef,
  Optional[String] $chunker_params                                            = undef,
  Optional[Enum['lz4', 'zstd', 'zlib', 'lzma']] $compression                  = 'lz4',
  Optional[Integer] $remote_rate_limit                                        = undef,
  Optional[String] $temporary_directory                                       = undef,
  Optional[String] $ssh_command                                               = undef,
  Optional[String] $borg_base_directory                                       = undef,
  Optional[String] $borg_config_directory                                     = undef,
  Optional[String] $borg_cache_directory                                      = undef,
  Optional[String] $borg_security_directory                                   = undef,
  Optional[String] $borg_keys_directory                                       = undef,
  Optional[String] $borg_create_umask                                         = undef,
  Optional[Integer] $lock_wait                                                = undef,
  Optional[String] $archive_name_format                                       = undef,
  Optional[Boolean] $relocated_repo_access_is_ok                              = undef,
  Optional[Boolean] $unknown_unencrypted_repo_access_is_ok                    = undef,
  Optional[String] $extra_borg_options_prune                                  = undef,
  Optional[String] $extra_borg_options_create                                 = undef,
  Optional[String] $extra_borg_options_check                                  = undef,
  Optional[String] $keep_within                                               = undef,
  Optional[Integer] $keep_secondly                                            = undef,
  Optional[Integer] $keep_minutely                                            = undef,
  Optional[Integer] $keep_hourly                                              = undef,
  Optional[Integer] $keep_daily                                               = undef,
  Optional[Integer] $keep_weekly                                              = undef,
  Optional[Integer] $keep_monthly                                             = undef,
  Optional[Integer] $keep_yearly                                              = undef,
  Optional[String] $retention_prefix                                          = undef,
  Optional[Array[Enum['repository', 'archives', 'extract', 'data']]] $checks  = undef,
  Optional[Array] $check_repositories                                         = undef,
  Optional[Integer] $check_last                                               = undef,
  Optional[String] $consistency_prefix                                        = undef,
  Optional[Array] $before_backup                                              = undef,
  Optional[Array] $before_prune                                               = undef,
  Optional[Array] $before_check                                               = undef,
  Optional[Array] $before_extract                                             = undef,
  Optional[Array] $before_everything                                          = undef,
  Optional[Array] $after_backup                                               = undef,
  Optional[Array] $after_prune                                                = undef,
  Optional[Array] $after_check                                                = undef,
  Optional[Array] $after_extract                                              = undef,
  Optional[Array] $after_everything                                           = undef,
  Optional[Array] $on_error                                                   = undef,
  Optional[String] $database_type                                             = undef,
  Optional[Hash] $databases                                                   = undef,
  Optional[String] $healthchecks                                              = undef,
  Optional[String] $cronitor                                                  = undef,
  Optional[String] $pagerduty                                                 = undef,
  Optional[String] $cronhub                                                   = undef,
  Optional[String] $borg_default_umask                                        = undef
){

  file { "${config_file_destination}/${config_file_name}":
    ensure  => file,
    content => epp('borgmatic/config.yaml.epp',
      {
        client                                => $client,
        backup_user                           => $backup_user,
        config_file_destination               => $config_file_destination,
        config_file_name                      => $config_file_name,
        source_directories                    => $source_directories,
        backup_servers                        => $backup_servers,
        one_file_system                       => $one_file_system,
        numeric_owner                         => $numeric_owner,
        atime                                 => $atime,
        ctime                                 => $ctime,
        birthtime                             => $birthtime,
        read_special                          => $read_special,
        bsd_flags                             => $bsd_flags,
        files_cache                           => $files_cache,
        local_path                            => $local_path,
        remote_path                           => $remote_path,
        patterns                              => $patterns,
        patterns_from                         => $patterns_from,
        exclude_patterns                      => $exclude_patterns,
        exclude_from                          => $exclude_from,
        exclude_caches                        => $exclude_caches,
        exclude_if_present                    => $exclude_if_present,
        keep_exclude_tags                     => $keep_exclude_tags,
        exclude_nodump                        => $exclude_nodump,
        borgmatic_source_directory            => $borgmatic_source_directory,
        encryption_passcommand                => $encryption_passcommand,
        encryption_passphrase                 => $encryption_passphrase,
        checkpoint_interval                   => $checkpoint_interval,
        chunker_params                        => $chunker_params,
        compression                           => $compression,
        remote_rate_limit                     => $remote_rate_limit,
        temporary_directory                   => $temporary_directory,
        ssh_command                           => $ssh_command,
        borg_base_directory                   => $borg_base_directory,
        borg_config_directory                 => $borg_config_directory,
        borg_cache_directory                  => $borg_cache_directory,
        borg_security_directory               => $borg_security_directory,
        borg_keys_directory                   => $borg_keys_directory,
        borg_create_umask                     => $borg_create_umask,
        lock_wait                             => $lock_wait,
        archive_name_format                   => $archive_name_format,
        relocated_repo_access_is_ok           => $relocated_repo_access_is_ok,
        unknown_unencrypted_repo_access_is_ok => $unknown_unencrypted_repo_access_is_ok,
        extra_borg_options_prune              => $extra_borg_options_prune,
        extra_borg_options_create             => $extra_borg_options_create,
        extra_borg_options_check              => $extra_borg_options_check,
        keep_within                           => $keep_within,
        keep_secondly                         => $keep_secondly,
        keep_minutely                         => $keep_minutely,
        keep_hourly                           => $keep_hourly,
        keep_daily                            => $keep_daily,
        keep_weekly                           => $keep_weekly,
        keep_monthly                          => $keep_monthly,
        keep_yearly                           => $keep_yearly,
        retention_prefix                      => $retention_prefix,
        checks                                => $checks,
        check_repositories                    => $check_repositories,
        check_last                            => $check_last,
        consistency_prefix                    => $consistency_prefix,
        before_backup                         => $before_backup,
        before_prune                          => $before_prune,
        before_check                          => $before_check,
        before_extract                        => $before_extract,
        before_everything                     => $before_everything,
        after_backup                          => $after_backup,
        after_prune                           => $after_prune,
        after_check                           => $after_check,
        after_extract                         => $after_extract,
        after_everything                      => $after_everything,
        on_error                              => $on_error,
        database_type                         => $database_type,
        databases                             => $databases,
        healthchecks                          => $healthchecks,
        cronitor                              => $cronitor,
        pagerduty                             => $pagerduty,
        cronhub                               => $cronhub,
        borg_default_umask                    => $borg_default_umask
      }
    ),
    require => File[$config_file_destination]
  }
}
