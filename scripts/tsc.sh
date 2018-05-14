#!/usr/bin/env bash

set -e;

rm -rf dist/*.ts
rm -rf dist/*.js

tsc
