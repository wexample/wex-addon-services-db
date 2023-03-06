#!/usr/bin/env bash

postgresServiceInstall() {
  wex-exec app::config/setValue -b -k=POSTGRES_VERSION -v=15.2
  wex-exec app::config/setValue -b -k=DB_CONTAINER -v=postgres
}
