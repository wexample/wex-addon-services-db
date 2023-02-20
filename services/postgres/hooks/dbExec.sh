#!/usr/bin/env bash

postgresDbExec() {
  local SERVICE_DIR="$(wex-exec app::service/dir -s="postgres")"

  # shellcheck source=dbConnect.sh
  source "${SERVICE_DIR}hooks/dbGo.sh"

  echo "$(postgresDbGo) -c '${1}'"
}
