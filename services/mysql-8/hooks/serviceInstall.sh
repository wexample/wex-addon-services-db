#!/usr/bin/env bash

mysql8ServiceInstall() {
  wex-exec app::config/setValue -b -k=DB_CONTAINER -v=mysql
}