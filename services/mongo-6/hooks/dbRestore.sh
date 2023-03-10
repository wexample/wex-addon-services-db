#!/usr/bin/env bash

mongo6DbRestore() {
  local DUMP="${1}"
  local DUMP_DIR="${DUMP}"

  DIR_CURRENT="$(realpath .)"
  cd "${WEX_DIR_APP_MONGO_DUMPS}"

  if [ -d "${DUMP_DIR}" ]; then
    _wexLog "Mongo : Restoring ${DUMP_DIR}..."
    wex-exec app/exec -n=mongo -c="mongorestore --drop /dump/${DUMP_DIR}"
  fi

  cd "${DIR_CURRENT}"
}
