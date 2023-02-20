#!/usr/bin/env bash

maria10DbExec() {
  wex-exec service/exec -s=mysql-8 -sf -c=dbExec
}
