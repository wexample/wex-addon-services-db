#!/usr/bin/env bash

maria10DbDumpsList() {
  wex service/exec -s=mysql-8 -sf -c=dbDumpsList
}
