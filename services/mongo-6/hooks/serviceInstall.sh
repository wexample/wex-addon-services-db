#!/usr/bin/env bash

mongo6ServiceInstall() {
  wex app::config/setValue -b -k=DB_CONTAINER -v=mongo
}