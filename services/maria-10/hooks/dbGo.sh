#!/usr/bin/env bash

maria10DbGo() {
  local SERVICE_DIR="$(wex app::service/dir -s="maria-10")"

  # shellcheck source=dbConnect.sh
  source "${SERVICE_DIR}hooks/dbConnect.sh"

  echo "mysql $(maria10DbConnect)"
}
