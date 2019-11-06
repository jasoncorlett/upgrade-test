#!/bin/bash

version() {
    echo ##SCRIPT_VERSION##
}

readonly dockerImage="jasoncorlett/upgrade-test"
readonly configFile="$HOME/upgrade-test/config.txt"

main() {
    local dockerVersion
    read dockerVersion < "$configFile"

    set -x
    docker run --rm \
        "${dockerImage}:${dockerVersion}" "$@"
}

upgrade() {
    local newVersion="${1-latest}"

    # docker pull "${dockerImage}:${newVersion}"
    docker run --rm \
        -v "$(readlink -f $0):/tmp/wrapper.sh" \
        "${dockerImage}:${newVersion}" upgrade

    echo -n "${newVersion}" > "$configFile"
}

case "$1" in
    version) version;;
    upgrade) shift; upgrade "$@";;
    *) main "$@";;
esac

