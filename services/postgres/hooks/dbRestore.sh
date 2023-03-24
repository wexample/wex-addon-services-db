#!/usr/bin/env bash

postgresDbRestore() {
  . "${WEX_FILEPATH_REL_CONFIG_BUILD}"
  local DUMP="${1}"

  local SERVICE_DIR="$(wex-exec app::service/dir -s="postgres")"

  # shellcheck source=dbConnect.sh
  source "${SERVICE_DIR}hooks/dbConnect.sh"

  local DB_COUNT=$(wex-exec app/exec -n=postgres -c="psql $(postgresDbConnect postgres) -XtAc \"SELECT 1 FROM pg_database WHERE datname='${GLOBAL_NAME}'\"")
  # Trim
  DB_COUNT=$(echo "${DB_COUNT}" | tr -dc '0-9')

  if [[ ${DB_COUNT} == "1" ]]; then
    # Copy SQL command in container.
    docker cp "${SERVICE_DIR}sql/dbDrop.sql" $(wex-exec app/container -c=postgres):/var/www/
    # Run drop command
    wex-exec app/exec -n=postgres -c="psql $(postgresDbConnect postgres) -v db_name=${GLOBAL_NAME} -v db_name_escaped=\"'${GLOBAL_NAME}'\" -f /var/www/dbDrop.sql"
  fi

  wex-exec app/exec -n=postgres -c="psql $(postgresDbConnect postgres) -c \"CREATE DATABASE ${GLOBAL_NAME}\""

  _wexLog "Importing data..."
  wex-exec app/exec -n=postgres -c="psql $(postgresDbConnect) -f /var/www/dumps/${DUMP}.sql"
}
