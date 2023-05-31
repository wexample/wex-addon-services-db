#!/usr/bin/env bash

sqlserverDbRestoreTest() {
  # Should be non interactive, so exit.
  wex db/go --non_interactive

  # Create table and insert row
  wex-exec app::db/exec -vv -c="CREATE TABLE users (id SERIAL PRIMARY KEY, name VARCHAR(255) NOT NULL, email VARCHAR(255) NOT NULL)"
  wex-exec app::db/exec -vv -c="INSERT INTO users (name, email) VALUES ('John Doe', 'john.doe@example.com')"

  # Test with zip.
  _serviceInstallTestDbDumpAndREstore true .sql "TRUNCATE TABLE users" "SELECT name FROM users LIMIT 1"

  # Test without zip.
  _serviceInstallTestDbDumpAndREstore false .sql "TRUNCATE TABLE users" "SELECT name FROM users LIMIT 1"
}
