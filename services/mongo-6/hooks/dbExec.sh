#!/usr/bin/env bash

mongo6DbExec() {
  local SERVICE_DIR="$(wex-exec app::service/dir -s="mongo-6")"

  # shellcheck source=dbGo.sh
  . "${SERVICE_DIR}hooks/dbGo.sh"

  echo "$(mongo6DbGo) --eval '${1}'"
}
