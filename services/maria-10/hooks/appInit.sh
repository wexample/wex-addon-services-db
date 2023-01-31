#!/usr/bin/env bash

maria10AppInit() {
  wex app::config/setValue -b -k=MARIA_VERSION -v=10.9
  wex app::config/setValue -k=MARIA_DB_PASSWORD -v="${WEX_DEFAULT_INSECURE_PASSWORD}"
}
