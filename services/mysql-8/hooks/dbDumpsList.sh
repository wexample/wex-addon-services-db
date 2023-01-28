#!/usr/bin/env bash

mysql8DbDumpsList() {
  # shellcheck source=.wex/tmp/config.build
  source "${WEX_FILEPATH_REL_CONFIG_BUILD}"

  find "${WEX_DIR_APP_DATA}${DB_CONTAINER}/dumps/" -type f \( -name "*.zip" -o -name "*.sql" \) -exec basename {} \;
}
