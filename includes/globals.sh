#!/usr/bin/env bash

WEX_DIR_APP_MONGO=${WEX_DIR_APP_DATA}mongo/
WEX_DIR_APP_MONGO_DUMPS=${WEX_DIR_APP_MONGO}dumps/

WEX_DIR_APP_MARIA=${WEX_DIR_APP_DATA}maria/
WEX_DIR_APP_MARIA_DUMPS=${WEX_DIR_APP_MARIA}dumps/

_wexDbDestroy() {
  . "${WEX_FILEPATH_REL_CONFIG}"

  _wexLog "Database : recreating"
  sudo rm -rf ".wex/${DB_CONTAINER}/data"

  mkdir ".wex/${DB_CONTAINER}/data"
}
