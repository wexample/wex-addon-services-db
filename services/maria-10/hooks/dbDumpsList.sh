#!/usr/bin/env bash

maria10DbDumpsList() {
  # Same as mysql.
  wex-exec service/exec -s=mysql-8 -sf -c=dbDumpsList
}
