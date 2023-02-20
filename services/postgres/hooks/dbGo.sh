#!/usr/bin/env bash

postgresDbGo() {
  local SERVICE_DIR="$(wex-exec app::service/dir -s="postgres")"

  # shellcheck source=dbConnect.sh
  source "${SERVICE_DIR}hooks/dbConnect.sh"

  echo "psql $(postgresDbConnect)"
}
