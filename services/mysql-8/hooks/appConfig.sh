#!/usr/bin/env bash

mysql8AppConfig() {
  # Need built vars to get mysql port.
  . "${WEX_FILEPATH_REL_CONFIG_BUILD}"
  . "${WEX_FILEPATH_REL_CONFIG}"

  MYSQL_DB_HOST=${MYSQL_DB_HOST:-"${NAME}_mysql_8"}
  MYSQL_DB_NAME=${MYSQL_DB_NAME:-${NAME}}
  MYSQL_DB_PASSWORD=${MYSQL_DB_PASSWORD:-${WEX_DEFAULT_INSECURE_PASSWORD}}
  MYSQL_DB_PORT=${MYSQL_DB_PORT:-3306}
  MYSQL_DB_USER=${MYSQL_DB_USER:-"root"}

  wex-exec app::config/setValue -k=MYSQL_DB_HOST -v="${MYSQL_DB_HOST}"
  wex-exec app::config/setValue -k=MYSQL_DB_NAME -v="${MYSQL_DB_NAME}"
  wex-exec app::config/setValue -k=MYSQL_DB_PASSWORD -v="${MYSQL_DB_PASSWORD}"
  wex-exec app::config/setValue -k=MYSQL_DB_PORT -v="${MYSQL_DB_PORT}"
  wex-exec app::config/setValue -k=MYSQL_DB_USER -v="${MYSQL_DB_USER}"

  _wexLog "MySql : creating cnf file"
  # Create connexion file info
  local DB_CONNECTION_FILE="${WEX_DIR_APP_TMP}mysql.cnf"

  touch "${DB_CONNECTION_FILE}"
  chmod 755 "${DB_CONNECTION_FILE}"
  echo '[client]' >"${DB_CONNECTION_FILE}"
  echo 'user = "'${MYSQL_DB_USER}'"' >>"${DB_CONNECTION_FILE}"
  echo 'password = "'${MYSQL_DB_PASSWORD}'"' >>"${DB_CONNECTION_FILE}"

  # Expected access level
  chmod 644 "${DB_CONNECTION_FILE}"
}
