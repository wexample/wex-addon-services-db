#!/usr/bin/env bash

maria10AppDestroy() {
  _wexLog "Maria : recreating database"
  sudo rm -rf .wex/maria/data

  mkdir .wex/maria/data
}