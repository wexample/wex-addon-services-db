#!/usr/bin/env bash

mongo6DbDump() {
  local DUMP_NAME="${1}"

  wex app/exec -n=mongo -c="mongodump --out /dump/${DUMP_NAME}"

  echo "${WEX_DIR_APP_MONGO_DUMPS}${DUMP_NAME}"
}
