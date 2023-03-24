#!/usr/bin/env bash

mysql8DbExec() {
  local SERVICE_DIR="$(wex-exec app::service/dir -s="mysql-8")"

  # shellcheck source=dbConnect.sh
  source "${SERVICE_DIR}hooks/dbGo.sh"

  # Change the end of line to avoid array splitting issues.
  echo "$(mysql8DbGo) -s -N ${GLOBAL_NAME} -e '${1}'" | tr -d '\r'
}
