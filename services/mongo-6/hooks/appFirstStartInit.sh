#!/usr/bin/env bash

mongo6AppFirstStartInit() {
  _wexLog "Initialize mongo DB replica set"

  . "${WEX_FILEPATH_REL_CONFIG_BUILD}"
  docker exec $(wex-exec app::app/container -c=mongo) mongosh --eval "rs.initiate({ _id: \"rs0\", members: [ { _id: 0, host: \"${APP_NAME}_${APP_ENV}_mongo:27017\" } ]})"
}
