#!/usr/bin/env bash

sqlserverDbGo() {
  local SERVICE_DIR="$(wex-exec app::service/dir -s="sqlserver")"

  # shellcheck source=dbConnect.sh
  source "${SERVICE_DIR}hooks/dbConnect.sh"

  echo "psql $(sqlserverDbConnect)"
}
