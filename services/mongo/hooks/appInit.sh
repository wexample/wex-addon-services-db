#!/usr/bin/env bash

mongoAppInit() {
  wex app::config/setValue -b -k=MONGO_VERSION -v=4.2.23-bionic
}
