#!/usr/bin/env bash

maria10DbExec() {
  local SERVICE_DIR="$(wex app::service/dir -s="maria-10")"

  # shellcheck source=dbConnect.sh
  source "${SERVICE_DIR}hooks/dbGo.sh"

  echo "$(maria10DbGo) -s -N ${APP_NAME} -e '${1}'"
}
