#!/usr/bin/env bash

mysql8DbRestoreTest() {
  # Should be non interactive, so exit.
  wex db/go --non_interactive

  wex-exec app::db/exec -vv -c="CREATE TABLE users (id INT NOT NULL AUTO_INCREMENT, name VARCHAR(255) NOT NULL, email VARCHAR(255) NOT NULL, PRIMARY KEY (id))"
  wex-exec app::db/exec -vv -c="INSERT INTO users (name, email) VALUES (\"John Doe\", \"john.doe@example.com\")"

  # Test with zip.
  _serviceInstallTestDbDumpAndREstore true .sql "TRUNCATE users" "SELECT name FROM users LIMIT 0,1"
  # Test without zip.
  _serviceInstallTestDbDumpAndREstore false .sql "TRUNCATE users" "SELECT name FROM users LIMIT 0,1"
}
