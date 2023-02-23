#!/usr/bin/env bash

mongo6DbExecTest() {
  wex app/start

  local STATUS
  STATUS=$(wex db/exec -c="rs.status()")

  _wexLog "Status : ${STATUS}"
  echo "${STATUS}"

  wex app/stop
}
