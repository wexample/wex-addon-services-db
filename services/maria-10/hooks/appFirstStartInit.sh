#!/usr/bin/env bash

maria10AppFirstStartInit() {
  . "${WEX_FILEPATH_REL_CONFIG_BUILD}"

  _wexLog "Maria : Waiting start"
  sleep 5

  _wexLog "Maria : Granting all permissions to root"
  wex app/exec -n=maria -c="mysql -uroot -p"${MYSQL_DB_PASSWORD}" -e 'GRANT ALL PRIVILEGES ON *.* TO root@localhost WITH GRANT OPTION;'"

  _wexLog "Maria : Flushing privileges"
  wex app/exec -n=maria -c="mysql -uroot -p"${MYSQL_DB_PASSWORD}" -e 'FLUSH PRIVILEGES;'"

  _wexLog "Maria : Creating default database '${NAME}'"
  wex app/exec -n=maria -c="mysql -uroot -p"${MYSQL_DB_PASSWORD}" -e 'CREATE DATABASE ${NAME};'"
}
