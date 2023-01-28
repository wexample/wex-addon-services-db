#!/usr/bin/env bash

maria10DbRestore() {
  wex service/exec -sf=mysql-8 -c=dbRestore -a="${1}"
}
