#!/usr/bin/env bash

maria10ServiceInstall() {
  wex app::config/setValue -b -k=DB_CONTAINER -v=maria
  wex app::config/setValue -b -k=MARIA_VERSION -v=10.9
  wex app::config/setValue -k=MARIA_DB_PASSWORD -v="${WEX_DEFAULT_INSECURE_PASSWORD}"
}