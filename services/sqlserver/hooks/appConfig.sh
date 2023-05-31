#!/usr/bin/env bash

sqlserverAppConfig() {
  . "${WEX_FILEPATH_REL_CONFIG}"
  . "${APP_PATH_ROOT}${WEX_DIR_APP_DATA}${WEX_FILE_APP_ENV}"

  # Seems host name differs from mysql and mariadb which uses short app name.
  SQLSERVER_DB_HOST=${SQLSERVER_DB_HOST:-"${NAME}_${APP_ENV}_sqlserver"}
  SQLSERVER_DB_NAME=${SQLSERVER_DB_NAME:-${NAME}}
  SQLSERVER_DB_PASSWORD=${SQLSERVER_DB_PASSWORD:-${WEX_DEFAULT_INSECURE_PASSWORD}}
  SQLSERVER_DB_PORT=${SQLSERVER_DB_PORT:-5432}
  SQLSERVER_DB_USER=${SQLSERVER_DB_USER:-"root"}

  wex-exec app::config/setValue -k=SQLSERVER_DB_HOST -v="${SQLSERVER_DB_HOST}"
  wex-exec app::config/setValue -k=SQLSERVER_DB_NAME -v="${SQLSERVER_DB_NAME}"
  wex-exec app::config/setValue -k=SQLSERVER_DB_PASSWORD -v="${SQLSERVER_DB_PASSWORD}"
  wex-exec app::config/setValue -k=SQLSERVER_DB_PORT -v="${SQLSERVER_DB_PORT}"
  wex-exec app::config/setValue -k=SQLSERVER_DB_USER -v="${SQLSERVER_DB_USER}"

  echo "*:*:*:${SQLSERVER_DB_NAME}:${SQLSERVER_DB_PASSWORD}" >"${WEX_DIR_APP_TMP}.pgpass"
}
