#!/usr/bin/env bash

maria10DbDump() {
  wex service/exec -s=mysql-8 -sf -c=dbDump -a="${1}"
}
