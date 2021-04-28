# @summary
#
# Append mysql backup configuration to the borgmatic configuiration file
#
class borgmatic::mysql (
  String $database,
  Optional[String] $hostname,
  Optional[Integer] $port,
  String $user,
  String $password,
  Optional[String] $mysql_dump_options
){

}
