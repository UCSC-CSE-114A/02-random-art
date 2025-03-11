#!/bin/bash
badfile=$1
badwords=$(paste -s -d '|' $badfile)

echo searching for banned keywords!
if grep -H -n '.*' src/* | sed 's:import.*$::g' | sed 's:--.*$::g' | grep --color -E '\b('$badwords')\b'; then
    echo "ERROR: Banned identifiers found (see tests/taboo for a list)."
    exit 1
else
    exit 0
fi
