#!/usr/bin/env bash

postgresAppConfig() {
  . "${WEX_FILEPATH_REL_CONFIG}"
  . "${APP_PATH_ROOT}${WEX_DIR_APP_DATA}${WEX_FILE_APP_ENV}"

  # Seems host name differs from mysql and mariadb which uses short app name.
  POSTGRES_DB_HOST=${POSTGRES_DB_HOST:-"${NAME}_${APP_ENV}_postgres"}
  POSTGRES_DB_NAME=${POSTGRES_DB_NAME:-${NAME}}
  POSTGRES_DB_PASSWORD=${POSTGRES_DB_PASSWORD:-${WEX_DEFAULT_INSECURE_PASSWORD}}
  POSTGRES_DB_PORT=${POSTGRES_DB_PORT:-5432}
  POSTGRES_DB_USER=${POSTGRES_DB_USER:-"root"}

  wex app::config/setValue -k=POSTGRES_DB_HOST -v="${POSTGRES_DB_HOST}"
  wex app::config/setValue -k=POSTGRES_DB_NAME -v="${POSTGRES_DB_NAME}"
  wex app::config/setValue -k=POSTGRES_DB_PASSWORD -v="${POSTGRES_DB_PASSWORD}"
  wex app::config/setValue -k=POSTGRES_DB_PORT -v="${POSTGRES_DB_PORT}"
  wex app::config/setValue -k=POSTGRES_DB_USER -v="${POSTGRES_DB_USER}"

  echo "*:*:*:${POSTGRES_DB_NAME}:${POSTGRES_DB_PASSWORD}" > "${WEX_DIR_APP_TMP}.pgpass"
}
