#!/bin/bash

function main() {
    if [[ $# -ne 1 ]]; then
        echo "USAGE: $0 <taboo word file>"
        return 1
    fi

    trap exit SIGINT

    local taboo_file=$1
    shift 1

    local taboo_words=$(paste -s -d '|' $taboo_file)

    echo 'Searching for banned keywords!'
    output=$(grep -H -n '.*' src/* | sed 's:import.*$::g' | sed 's:--.*$::g' | sed 's:{-.*$::g' | grep --color -E "\b($taboo_words)\b")

    local exit_status=$?
    if [[ ${exit_status} -eq 0 ]]; then
        echo "ERROR: Banned identifiers found (see '${taboo_file}' for a list)."
        echo 'Found the following issues:'
        echo "${output}"
        return 1
    else
        echo 'No issues found!'
        return 0
    fi
}

[[ "${BASH_SOURCE[0]}" == "${0}" ]] && main "$@"
