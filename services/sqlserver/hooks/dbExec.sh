#!/usr/bin/env bash

sqlserverDbExec() {
  local SERVICE_DIR
  SERVICE_DIR="$(wex-exec app::service/dir -s="sqlserver")"

  # shellcheck source=dbConnect.sh
  source "${SERVICE_DIR}hooks/dbGo.sh"

  # In Postgres, double quotes are not allowed,
  # so we expect single quotes and need to escape them.
  local SQL="${1//\'/\'\\\'\'}"

  # Remove leading and trailing spaces.
  echo "$(sqlserverDbGo) -t -c '${SQL}' | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//'"
}
