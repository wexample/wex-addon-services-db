#!/usr/bin/env bash

maria10DbDumpsList() {
  wex service/exec -sf=mysql-8 -c=dbDumpsList
}
