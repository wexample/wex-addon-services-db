#!/usr/bin/env bash

mysql8DbRestoreTest() {
  # Should be non interactive, so exit.
  wex db/go --non_interactive

  wex-exec app::db/exec -vv -c="TRUNCATE users"
  wex-exec app::db/exec -vv -c="CREATE TABLE users (id INT NOT NULL AUTO_INCREMENT, name VARCHAR(255) NOT NULL, email VARCHAR(255) NOT NULL, PRIMARY KEY (id))"
  wex-exec app::db/exec -vv -c="INSERT INTO users (name, email) VALUES (\"John Doe\", \"john.doe@example.com\")"

  # Test with zip.
  _mysql8DbRestoreTestFormat true
  # Test without zip.
  _mysql8DbRestoreTestFormat false
}

_mysql8DbRestoreTestFormat() {
  local EXT
  local ZIP=${1}

  if [ "${ZIP}" = "true" ];then
    EXT=zip
  else
    EXT=sql
  fi

  # Create dump.
  wex-exec app::db/dump -f="test-dump" -z="${ZIP}"
  # Check dump exists.
  _wexTestFileExists ".wex/mysql/dumps/test-dump.${EXT}"
  # Clear db.
  wex-exec app::db/exec -vv -c="TRUNCATE users"
  # Restore dump.
  wex-exec app::db/restore -f="test-dump.${EXT}"
  # Check restoration.
  local USERNAME
  USERNAME=$(wex-exec app::db/exec -c="SELECT name FROM users LIMIT 0,1")

  _wexTestAssertEqual "${USERNAME}" "John Doe"
}

