#!/usr/bin/env bash

mongo6DbExecTest() {
  wex app/start

  local STATUS
  STATUS=$(wex db/exec -c="rs.status()")

  ${STATUS}

  wex app/stop
}
