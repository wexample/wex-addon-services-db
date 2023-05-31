#!/usr/bin/env bash

sqlserverDbConnect() {
  if [ "${1}" != "" ]; then
    local DB_NAME=${1}
  else
    source "${WEX_FILEPATH_REL_CONFIG_BUILD}"
    local DB_NAME=${APP_NAME}
  fi

  echo "sqlserverql://${SQLSERVER_DB_USER}:"${SQLSERVER_DB_PASSWORD}"@localhost/${DB_NAME}"
}
