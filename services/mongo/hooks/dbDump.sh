#!/usr/bin/env bash

mongoDbDump() {
  local DUMP_NAME="${1}"

  _wexLog "Mongo : dumping data to ${DUMP_NAME}..."
  wex app/exec -n=mongo -c="mongodump --out /dump/${DUMP_NAME}"

  DIR_CURRENT="$(realpath .)"

  _wexLog "Mongo : Zip data in ${DUMP_NAME}.zip"
  cd "${WEX_DIR_APP_MONGO_DUMPS}"

  zip -r "${DUMP_NAME}.zip" "${DUMP_NAME}"

  _wexLog "Mongo : Cleaning up"
  rm -rf "${DUMP_NAME}"
  cd "${DIR_CURRENT}"

  echo "${WEX_DIR_APP_MONGO_DUMPS}${DUMP_NAME}.zip"
}
