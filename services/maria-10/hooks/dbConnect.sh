#!/usr/bin/env bash

maria10DbConnect() {
  wex-exec service/exec -s=mysql-8 -sf -c=dbConnect
}
