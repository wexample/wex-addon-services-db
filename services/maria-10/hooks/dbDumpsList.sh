#!/usr/bin/env bash

maria10DbDumpsList() {
  find "${WEX_DIR_APP_MARIA_DUMPS}" -type f -name "*.zip" -exec basename {} \;
}
