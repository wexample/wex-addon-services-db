#!/usr/bin/env bash

maria10ServiceInstall() {
  wex-exec app::config/setValue -b -k=DB_CONTAINER -v=maria
  wex-exec app::config/setValue -b -k=MARIA_VERSION -v=10.9
  wex-exec app::config/setValue -b -k=MARIA_DB_PASSWORD -v="${WEX_DEFAULT_INSECURE_PASSWORD}"
}
