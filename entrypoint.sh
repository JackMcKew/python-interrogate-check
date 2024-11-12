#!/bin/sh
set -eax

interrogate --version

IGNORE_MODULE=$([[ "$4" == true ]] && echo '-M' || echo '')
VERBOSE=$([[ "$5" == true ]] && echo '--verbose' || echo '')

if interrogate --fail-under $2 --generate-badge $3 $1 | grep -q 'PASSED'; then
    interrogate --fail-under $2 --generate-badge $3 $IGNORE_MODULE $1
    exit 0
else 
    interrogate --fail-under $2 --generate-badge $3 $IGNORE_MODULE $1 $VERBOSE
    exit 1
fi