# @summary
# Append postegresql backup configuration to the borgmatic configuiration file
#
class borgmatic::databases::postgresql (
  String $database,
  Optional[String] $hostname,
  Optional[Integer] $port,
  String $user,
  String $password,
  Optional[Enum['plain', 'custom', 'directory', 'tar']] $format,
  Optional[Enum['disable', 'allow', 'prefer', 'require', 'verify-ca', 'verify-full']] $ssl_mode,
  Optional[String] $ssl_cert,
  Optional[String] $ssl_key,
  Optional[String] $ssl_root_cert,
  Optional[String] $ssl_crl,
  Optional[String] $pg_dump_options
){

}
