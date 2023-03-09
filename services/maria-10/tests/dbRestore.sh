#!/usr/bin/env bash

maria10DbRestoreTest() {
  wex-exec app::service/exec -s="mysql-8" -sf -c=dbRestore --test
}
