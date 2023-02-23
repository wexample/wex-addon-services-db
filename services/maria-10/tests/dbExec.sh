#!/usr/bin/env bash

maria10DbExecTest() {
  wex-exec app::service/exec -s="mysql-8" -sf -c=dbDump --test
}
