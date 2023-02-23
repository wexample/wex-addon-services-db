#!/usr/bin/env bash

mysql8Test() {
  _wexTestAssertEqual $(wex-exec file/lineExists -f=".gitignore" -l="/dumps/*") true
}
