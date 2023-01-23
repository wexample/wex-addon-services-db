#!/usr/bin/env bash

mysql8Started() {
  . ${WEX_FILEPATH_REL_CONFIG}

  _wexMessage "Lock MySQL site.cnf access"

  docker exec ${APP_NAME_INTERNAL}_${DB_CONTAINER} chmod 644 /var/www/tmp/mysql.cnf
  docker exec ${APP_NAME_INTERNAL}_${DB_CONTAINER} chmod 644 /etc/mysql/conf.d/site.cnf
}
