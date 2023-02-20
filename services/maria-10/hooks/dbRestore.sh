#!/usr/bin/env bash

maria10DbRestore() {
  wex-exec service/exec -s=mysql-8 -sf -c=dbRestore -a="${1}"
}
