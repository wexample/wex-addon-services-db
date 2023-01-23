#!/usr/bin/env bash

mongo6AppInit() {
  wex app::config/setValue -b -k=MONGO_VERSION -v=6.0.3
}
