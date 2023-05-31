#!/usr/bin/env bash

sqlserverServiceInstall() {
  wex-exec app::config/setValue -b -k=SQLSERVER_VERSION -v=2022-latest
  wex-exec app::config/setValue -b -k=DB_CONTAINER -v=sqlserver
}
