#!/usr/bin/env bash

postgresAppConfig() {
  . "${WEX_FILEPATH_REL_CONFIG}"
  . "${CONTEXT_DIR}${WEX_DIR_APP_DATA}${WEX_FILE_APP_ENV}"

  # Seems host name differs from mysql and mariadb which uses short app name.
  POSTGRES_DB_HOST=${POSTGRES_DB_HOST:-"${NAME}_${CONTEXT_ENV}_postgres"}
  POSTGRES_DB_NAME=${POSTGRES_DB_NAME:-${NAME}}
  POSTGRES_DB_PASSWORD=${POSTGRES_DB_PASSWORD:-${WEX_DEFAULT_INSECURE_PASSWORD}}
  POSTGRES_DB_PORT=${POSTGRES_DB_PORT:-5432}
  POSTGRES_DB_USER=${POSTGRES_DB_USER:-"root"}

  wex-exec app::config/setValue -k=POSTGRES_DB_HOST -v="${POSTGRES_DB_HOST}"
  wex-exec app::config/setValue -k=POSTGRES_DB_NAME -v="${POSTGRES_DB_NAME}"
  wex-exec app::config/setValue -k=POSTGRES_DB_PASSWORD -v="${POSTGRES_DB_PASSWORD}"
  wex-exec app::config/setValue -k=POSTGRES_DB_PORT -v="${POSTGRES_DB_PORT}"
  wex-exec app::config/setValue -k=POSTGRES_DB_USER -v="${POSTGRES_DB_USER}"

  echo "*:*:*:${POSTGRES_DB_NAME}:${POSTGRES_DB_PASSWORD}" >"${WEX_DIR_APP_TMP}.pgpass"
}
