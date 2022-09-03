#!/bin/bash
badfile=$1
badwords=$(paste -s -d '|' $badfile)

echo searching for banned keywords!
grep -H -n '.*' src/* | sed 's:import.*$::g' | sed 's:--.*$::g' | grep --color -E '[[:<:]]('$badwords')[[:>:]]'

