#!/bin/sh
set -eax

interrogate --version

if interrogate --generate-badge $2 $1 | grep -q 'PASSED'; then
    interrogate --generate-badge $2 $1
    exit 0
else 
    echo interrogate --generate-badge $2 $1
    exit 1
fi