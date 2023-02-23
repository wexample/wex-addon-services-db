#!/usr/bin/env bash

mysql8DbExecTest() {
  wex-exec app::app/start

  _wexLog "Waiting for MySQL to start..."
  sleep 5

  local OUTPUT
  OUTPUT=($(wex-exec db/exec -c="SHOW DATABASES"))

  local SUCCESS=false
  if [[ " ${OUTPUT[*]} " =~ " information_schema " ]] && \
     [[ " ${OUTPUT[*]} " =~ " mysql " ]] && \
     [[ " ${OUTPUT[*]} " =~ " performance_schema " ]] && \
     [[ " ${OUTPUT[*]} " =~ " sys " ]]; then
      SUCCESS=true
  fi

  _wexLog "Database tables :"
  printf "${OUTPUT[*]}"

  _wexTestAssertEqual "${SUCCESS}" "true"

  wex-exec app::app/stop
}
