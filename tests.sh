#!/usr/bin/env bash

set -eou

build_all()
{
  for file in ./Dockerfile.*
  do
    docker build -t random -f $file .
  done
}
build_all