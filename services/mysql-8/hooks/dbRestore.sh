#!/usr/bin/env bash

mysql8DbRestore() {
  local DUMP="${1}"

  # shellcheck source=.wex/tmp/config.build
  source "${WEX_FILEPATH_REL_CONFIG_BUILD}"

  local SERVICE_DIR
  SERVICE_DIR="$(wex app::service/dir -s="mysql-8")"

  # shellcheck source=dbConnect.sh
  source "${SERVICE_DIR}hooks/dbConnect.sh"
  # shellcheck source=.wex/tmp/config.build
  source "${WEX_FILEPATH_REL_CONFIG_BUILD}"

  wex app/exec -n="${DB_CONTAINER}" -c="mysql $(mysql8DbConnect) ${APP_NAME} < /var/www/dumps/${DUMP}"
}
