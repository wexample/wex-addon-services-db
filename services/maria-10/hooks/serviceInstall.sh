#!/usr/bin/env bash

maria10ServiceInstall() {
  wex app::config/setValue -b -k=DB_CONTAINER -v=maria
}