#!/usr/bin/env bash

mongoDbRestore() {
  local DUMP="${1}"
  local DUMP_DIR="${DUMP}"

  DIR_CURRENT="$(realpath .)"
  cd "${WEX_DIR_APP_MONGO_DUMPS}"

  # Zip file.
  if [ -f "${DUMP}" ];then
    DUMP_DIR=$(basename "${DUMP%.*}")

    # Not already extracted.
    if [ ! -d "${DUMP_DIR}" ];then
      _wexLog "Mongo : Unpacking ${DUMP}..."
      unzip "${DUMP}"
    fi
  fi

  if [ -d "${DUMP_DIR}" ];then
    _wexLog "Mongo : Restoring ${DUMP_DIR}..."
    wex app/exec -n=mongo -c="mongorestore --drop /dump/${DUMP_DIR}"
  fi

  cd "${DIR_CURRENT}"
}
