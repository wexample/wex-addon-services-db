#!/usr/bin/env bash

mongo6DbDump() {
  local DUMP_NAME="${1}"

  wex-exec app/exec -n=mongo -c="mongodump --out /dump/${DUMP_NAME}" >/dev/null 2>&1

  echo "${WEX_DIR_APP_MONGO_DUMPS}${DUMP_NAME}"
}
