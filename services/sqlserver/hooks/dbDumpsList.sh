#!/usr/bin/env bash

sqlserverDbDumpsList() {
  # Same as mysql.
  wex-exec service/exec -s=mysql-8 -sf -c=dbDumpsList
}
