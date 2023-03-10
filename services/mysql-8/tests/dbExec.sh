#!/usr/bin/env bash

mysql8DbExecTest() {
  _wexLog "Waiting for database to be ready..."
  sleep 5

  local TABLES=()
  TABLES=($(wex-exec db/exec -c="SHOW DATABASES"))

  _wexLog "Database tables :"
  printf '%s\n' "${TABLES[@]}"

  local EXPECTED_TABLES=("information_schema" "mysql" "performance_schema" "sys")
  local SUCCESS=true

  for EXPECTED_TABLE in "${EXPECTED_TABLES[@]}"; do
    if ! printf '%s\n' "${TABLES[@]}" | grep -q -w "$EXPECTED_TABLE"; then
      SUCCESS=false
      break
    fi
  done

  _wexTestAssertEqual "${SUCCESS}" "true"
}
