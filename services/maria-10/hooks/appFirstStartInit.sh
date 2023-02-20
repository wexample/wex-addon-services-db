#!/usr/bin/env bash

maria10AppFirstStartInit() {
  . "${WEX_FILEPATH_REL_CONFIG_BUILD}"

  _wexLog "Maria : Waiting start"
  sleep 5

  _wexLog "Maria : Granting all permissions to root"
  wex-exec db/exec -vv -c="GRANT ALL PRIVILEGES ON *.* TO root@localhost WITH GRANT OPTION"

  _wexLog "Maria : Flushing privileges"
  wex-exec db/exec -vv -c="FLUSH PRIVILEGES"
}
