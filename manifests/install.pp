# @summary
# Installs borg and borgmatic
#
# @example
#   include borgmatic::install
class borgmatic::install {
  assert_private()

  ensure_packages(['borgmatic'])
}
