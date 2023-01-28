#!/usr/bin/env bash

maria10DbConnect() {
  wex service/exec -sf=mysql-8 -c=dbConnect
}
