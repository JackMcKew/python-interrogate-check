#!/bin/sh
set -eax

interrogate --version

if interrogate --generate-badge $2 $1 | grep -q 'PASSED'; then
    echo 0
else 
    echo 1
fi