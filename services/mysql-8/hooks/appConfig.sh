#!/usr/bin/env bash

mysql8AppConfig() {
  _wexLog "MySql : configuration"
  printf "\n" >> "${WEX_FILEPATH_REL_CONFIG_BUILD}"
  wex app::config/addTitle -t="MySql8\n"

  _wexLog "MySql : set DB_CONTAINER"
  wex app::config/setValue -k=DB_CONTAINER -v="mysql8"
  wex app::config/setValue -k=MYSQL_DB_PASSWORD -v="testPass"

  local MYSQL_DB_HOST
  local MYSQL_DB_NAME
  local MYSQL_DB_PASSWORD
  local MYSQL_DB_PORT
  local MYSQL_DB_USER

  MYSQL_DB_HOST=$([ "${MYSQL_DB_HOST}" != "" ] && { echo "${MYSQL_DB_HOST}"; } || echo "${NAME}_${APP_ENV}_mysql8" )
  MYSQL_DB_NAME=$([ "${MYSQL_DB_NAME}" != "" ] && { echo "${MYSQL_DB_NAME}"; } || echo "root" )
  MYSQL_DB_PASSWORD=$([ "${MYSQL_DB_PASSWORD}" != "" ] && { echo "${MYSQL_DB_PASSWORD}"; } || echo "thisIsAReallyNotSecurePassword!" )
  MYSQL_DB_PORT=$([ "${MYSQL_DB_PORT}" != "" ] && { echo "${MYSQL_DB_PORT}"; } || echo 3306 )
  MYSQL_DB_USER=$([ "${MYSQL_DB_USER}" != "" ] && { echo "${MYSQL_DB_USER}"; } || echo "root" )

  wex app::config/setValue -k=MYSQL_DB_HOST -v="${MYSQL_DB_HOST}"
  wex app::config/setValue -k=MYSQL_DB_NAME -v="${MYSQL_DB_NAME}"
  wex app::config/setValue -k=MYSQL_DB_PASSWORD -v="${MYSQL_DB_PASSWORD}"
  wex app::config/setValue -k=MYSQL_DB_PORT -v="${MYSQL_DB_PORT}"
  wex app::config/setValue -k=MYSQL_DB_USER -v="${MYSQL_DB_USER}"

  _wexLog "MySql : Bind files to config"
  wex app::config/bindFiles -s=mysql -e=cnf

  # Create connexion file info
  local DB_CONNECTION_FILE="${WEX_DIR_APP_TMP}mysql.cnf"

  touch "${DB_CONNECTION_FILE}"
  chmod 755 "${DB_CONNECTION_FILE}"
  echo '[client]' > "${DB_CONNECTION_FILE}"
  echo 'user = "'${MYSQL_DB_USER}'"' >> "${DB_CONNECTION_FILE}"
  echo 'password = "'${MYSQL_DB_PASSWORD}'"' >> "${DB_CONNECTION_FILE}"
  echo 'host = "'${MYSQL_DB_HOST}'"' >> "${DB_CONNECTION_FILE}"

  # Expected access level
  chmod 644 "${DB_CONNECTION_FILE}"
}