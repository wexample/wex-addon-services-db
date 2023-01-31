#!/usr/bin/env bash

mysql8ServiceInstall() {
  wex app::config/setValue -b -k=DB_CONTAINER -v=mysql
}