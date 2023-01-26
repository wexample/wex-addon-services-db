#!/usr/bin/env bash

maria10DbDump() {
  local DUMP_NAME="${1}"
  local SERVICE_DIR="$(wex app::service/dir -s="maria-10")"

  # shellcheck source=dbConnect.sh
  source "${SERVICE_DIR}hooks/dbConnect.sh"

  wex app/exec -n=maria -c="mysqldump $(maria10DbConnect) ${APP_NAME} > /var/www/dumps/${DUMP_FILE_NAME}"

  echo "${WEX_DIR_APP_MARIA_DUMPS}${DUMP_NAME}"
}
