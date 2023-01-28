#!/usr/bin/env bash

mysql8DbDump() {
  local DUMP_NAME="${1}"
  local SERVICE_DIR="$(wex app::service/dir -s="mysql-8")"
  DUMP_FILE_NAME+=".sql"

  # shellcheck source=dbConnect.sh
  source "${SERVICE_DIR}hooks/dbConnect.sh"

  wex app/exec -n=${DB_CONTAINER} -c="mysqldump $(mysql8DbConnect) ${APP_NAME} > /var/www/dumps/${DUMP_FILE_NAME}"

  # Seems some dumps files take a while to be accessible.
  sleep 2

  echo "${WEX_DIR_APP_DATA}${DB_CONTAINER}/dumps/${DUMP_NAME}"
}
