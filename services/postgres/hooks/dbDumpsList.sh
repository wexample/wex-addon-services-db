#!/usr/bin/env bash

postgresDbDumpsList() {
  # Same as mysql.
  wex service/exec -s=mysql-8 -sf -c=dbDumpsList
}
