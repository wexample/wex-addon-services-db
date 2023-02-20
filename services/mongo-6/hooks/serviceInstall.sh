#!/usr/bin/env bash

mongo6ServiceInstall() {
  wex-exec app::config/setValue -b -k=DB_CONTAINER -v=mongo
  wex-exec app::config/setValue -b -k=MONGO_VERSION -v=6.0.3
}