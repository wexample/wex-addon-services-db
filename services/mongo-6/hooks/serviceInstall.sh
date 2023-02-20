#!/usr/bin/env bash

mongo6ServiceInstall() {
  wex app::config/setValue -b -k=DB_CONTAINER -v=mongo
  wex app::config/setValue -b -k=MONGO_VERSION -v=6.0.3
}