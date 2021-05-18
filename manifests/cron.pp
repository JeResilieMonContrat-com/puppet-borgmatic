# @summary
# Creates the cron configuration for borgmatic
#
define borgmatic::cron (
  Optional[String] $cron_command                                              = '/root/.local/bin/borgmatic',
  Optional[String] $cron_environment                                          = undef,
  Optional[String] $cron_user                                                 = 'root',
  Optional $cron_minute                                                       = '*',
  Optional $cron_hour                                                         = '*',
  Optional $cron_weekday                                                      = '*',
  Optional $cron_monthday                                                     = '*',
  Optional $cron_month                                                        = '*'
){
  cron { $title:
    ensure      => present,
    command     => $cron_command,
    environment => $cron_environment,
    user        => $cron_user,
    minute      => $cron_minute,
    hour        => $cron_hour,
    weekday     => $cron_weekday,
    monthday    => $cron_monthday,
    month       => $cron_month
  }
}
