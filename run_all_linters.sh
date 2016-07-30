#!/bin/bash

LINTERS_DIR="linters"

mkdir -p $LINTERS_DIR

echo "[Run patch-level verification for Bundler]"
bundle-audit update
bundle-audit > $LINTERS_DIR/bundle-audit.html
echo "------------------------------------------"

echo "[Run a Ruby static code analyzer]"
rubocop --format html -o $LINTERS_DIR/rubocop.html
echo "------------------------------------------"

echo "[Run a static analysis security vulnerability scanner for Ruby on Rails applications]"
brakeman -o $LINTERS_DIR/brakeman.html
echo "------------------------------------------"
