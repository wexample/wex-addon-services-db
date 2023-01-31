#!/usr/bin/env bash

mysql8DbGo() {
  local SERVICE_DIR="$(wex app::service/dir -s="mysql-8")"

  # shellcheck source=dbConnect.sh
  source "${SERVICE_DIR}hooks/dbConnect.sh"

  echo "mysql $(mysql8DbConnect)"
}
