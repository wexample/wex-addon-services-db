#!/usr/bin/env bash

postgresDbConnect() {
  if [ "${1}" != "" ]; then
    local DB_NAME=${1}
  else
    source "${WEX_FILEPATH_REL_CONFIG_BUILD}"
    local DB_NAME=${GLOBAL_NAME}
  fi

  echo "postgresql://${POSTGRES_DB_USER}:"${POSTGRES_DB_PASSWORD}"@localhost/${DB_NAME}"
}
