#!/bin/bash

main() {
    cat /message.txt

    for a in "$@"; do
        echo "$a"
    done
}

upgrade() {
    if [[ -w /tmp/wrapper.sh ]]; then
        cat /wrapper.sh > /tmp/wrapper.sh
    else
        echo "Cannot upgrade script in-place, please check permissions"
        exit 1
    fi
}

case "$1" in
    upgrade) shift; upgrade "$@";;
    *) main "$@";;
esac


