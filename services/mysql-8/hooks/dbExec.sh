#!/usr/bin/env bash

mysql8DbExec() {
  local SERVICE_DIR="$(wex-exec app::service/dir -s="mysql-8")"

  # shellcheck source=dbConnect.sh
  source "${SERVICE_DIR}hooks/dbGo.sh"

  echo "$(mysql8DbGo) -s -N ${APP_NAME} -e '${1}'"
}
