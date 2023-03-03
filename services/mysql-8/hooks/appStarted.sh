#!/usr/bin/env bash

mysql8AppStarted() {
  _wexLog "Waiting for database to be ready..."
  sleep 5

  local TABLES=()
  while [[ ${#TABLES[@]} -lt 5 ]]; do
    _wexLog "Waiting until all tables have been created..."
    printf "${TABLES[*]}"
    sleep 1

    TABLES=($(wex-exec db/exec -c="SHOW DATABASES"))
  done
}
