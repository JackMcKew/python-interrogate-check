#!/bin/sh
set -eax

interrogate --version
interrogate --fail-under $2 --exclude $3 --ignore-init-method $4 --ignore-init-module $5 --generate-badge $6 $1