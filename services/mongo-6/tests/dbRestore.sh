#!/usr/bin/env bash

mongo6DbRestoreTest() {
  # Should be non interactive, so exit.
  wex db/go --non_interactive

  # Create collection and insert document
  wex-exec app::db/exec -vv -c="db.users.insertOne({name: \"John Doe\", email: \"john.doe@example.com\"})"

  # Test with zip.
  _serviceInstallTestDbDumpAndREstore true "" "db.users.deleteMany({})" "db.users.findOne({},{_id:0,name:1}).name"

  # Test without zip.
  _serviceInstallTestDbDumpAndREstore false "" "db.users.deleteMany({})" "db.users.findOne({},{_id:0,name:1}).name"
}
