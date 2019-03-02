#!/bin/bash
set -e

cat <<EOT > pcf-prometheus-pipeline/runtime.yml
releases:
- name: node-exporter
  version: ((node_exporter_version))

addons:
- name: node_exporter
  include:
    stemcell:
    - os: ubuntu-trusty
    - os: ubuntu-xenial
  jobs:
  - name: node_exporter
release: node-exporter
EOT

cp -R pcf-prometheus-pipeline fixed-runtime
