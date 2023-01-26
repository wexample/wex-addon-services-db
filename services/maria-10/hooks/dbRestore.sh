#!/usr/bin/env bash

maria10DbRestore() {
  local DUMP="${1}"

  # shellcheck source=.wex/tmp/config.build
  source "${WEX_FILEPATH_REL_CONFIG_BUILD}"

  # shellcheck source=dbConnect.sh
  source "${SERVICE_DIR}hooks/dbConnect.sh"

  wex app/exec -n=maria -c="mysql $(maria10DbConnect) ${APP_NAME} < /var/www/dumps/${DUMP}"
}
