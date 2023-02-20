#!/usr/bin/env bash

mysql8Test() {
  wexTestAssertEqual $(wex-exec file/lineExists -f=".gitignore" -l="/dumps/*") true
}
