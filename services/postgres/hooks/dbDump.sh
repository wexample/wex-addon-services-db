#!/usr/bin/env bash

postgresDbDump() {
  . "${WEX_FILEPATH_REL_CONFIG_BUILD}"

  local DUMP_NAME="${1}"
  local SERVICE_DIR="$(wex app::service/dir -s=postgres)"
  DUMP_FILE_NAME="${DUMP_NAME}.sql"

  # shellcheck source=dbConnect.sh
  source "${SERVICE_DIR}hooks/dbConnect.sh"

  wex app/exec -n="${DB_CONTAINER}" -c="pg_dump -f /var/www/dumps/${DUMP_FILE_NAME} $(postgresDbConnect)"

  echo "${WEX_DIR_APP_DATA}${DB_CONTAINER}/dumps/${DUMP_FILE_NAME}"
}
