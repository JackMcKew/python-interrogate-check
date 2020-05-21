#!/bin/sh
set -eax

interrogate --version
interrogate $1 --fail-under $2 --exclude $3 --ignore-init-method $4 --ignore-init-module $5 --generate-badge $6