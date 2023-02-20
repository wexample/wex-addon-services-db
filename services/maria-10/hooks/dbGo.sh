#!/usr/bin/env bash

maria10DbGo() {
  wex-exec service/exec -s=mysql-8 -sf -c=dbGo
}
