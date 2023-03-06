#!/usr/bin/env bash

mongo6DbExecTest() {
  local STATUS
  STATUS=$(wex db/exec -c="rs.status()")

  _wexLog "Status : ${STATUS}"
  echo "${STATUS}"
}
