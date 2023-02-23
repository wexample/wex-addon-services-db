#!/usr/bin/env bash

postgresDbExecTest() {
  . "${WEX_FILEPATH_REL_CONFIG_BUILD}"
  wex-exec app::app/start

  _wexLog "Waiting for PostGre to start..."
  sleep 5

  local OUTPUT
  OUTPUT=$(wex-exec db/exec -c="\l")

  _wexLog "Database tables :"
  printf "${OUTPUT}"

  local SUCCESS=true

  # Should contain a postgres database.
  if [ "$(echo "${OUTPUT}" | grep "postgres")" = "" ];then
    SUCCESS=false
  fi

  # Should contain a database using app name.
  if [ "$(echo "${OUTPUT}" | grep "${APP_NAME}")" = "" ];then
    SUCCESS=false
  fi

  _wexTestAssertEqual "${SUCCESS}" "true"

  wex-exec app::app/stop
}
