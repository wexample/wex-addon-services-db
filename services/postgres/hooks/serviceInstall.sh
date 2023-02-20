#!/usr/bin/env bash

postgresServiceInstall() {
  wex-exec app::config/setValue -b -k=POSTGRES_VERSION -v=8.9.10-community
  wex-exec app::config/setValue -b -k=DB_CONTAINER -v=postgres
}
