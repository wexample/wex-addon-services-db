#!/usr/bin/env bash

maria10AppConfig() {
  . "${WEX_FILEPATH_REL_CONFIG}"

  wex config/bindFiles -s=maria -e=cnf.json

  MARIA_DB_HOST=${MARIA_DB_HOST:-"${NAME}_maria_10"}
  MARIA_DB_NAME=${MARIA_DB_NAME:-${NAME}}
  MARIA_DB_PASSWORD=${MARIA_DB_PASSWORD:-${WEX_DEFAULT_INSECURE_PASSWORD}}
  MARIA_DB_PORT=${MARIA_DB_PORT:-3306}
  MARIA_DB_USER=${MARIA_DB_USER:-"root"}

  wex app::config/setValue -k=MYSQL_DB_HOST -v="${MARIA_DB_HOST}"
  wex app::config/setValue -k=MYSQL_DB_NAME -v="${MARIA_DB_NAME}"
  wex app::config/setValue -k=MYSQL_DB_PASSWORD -v="${MARIA_DB_PASSWORD}"
  wex app::config/setValue -k=MYSQL_DB_PORT -v="${MARIA_DB_PORT}"
  wex app::config/setValue -k=MYSQL_DB_USER -v="${MARIA_DB_USER}"

  _wexLog "Maria : creating cnf file"
  # Create connexion file info
  local DB_CONNECTION_FILE="${WEX_DIR_APP_TMP}mysql.cnf"

  touch "${DB_CONNECTION_FILE}"
  chmod 755 "${DB_CONNECTION_FILE}"
  echo '[client]' >"${DB_CONNECTION_FILE}"
  echo 'user = "'${MARIA_DB_USER}'"' >>"${DB_CONNECTION_FILE}"
  echo 'password = "'${MARIA_DB_PASSWORD}'"' >>"${DB_CONNECTION_FILE}"
  #  echo 'host = "'${MARIA_DB_HOST}'"' >> "${DB_CONNECTION_FILE}"

  # Expected access level
  chmod 644 "${DB_CONNECTION_FILE}"
}
