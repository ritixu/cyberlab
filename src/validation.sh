#!/usr/bin/env bash

CONFIG_FILE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/labs/labs.conf"

check_prerequisites() {
    if ! command -v docker &> /dev/null; then
        echo "Error: Docker is not installed!" >&2
        exit 1
    fi

    if [ -f "$CONFIG_FILE" ]; then
    source "$CONFIG_FILE"
    else
    echo "[-] Error: Central configuration file missing at $CONFIG_FILE"
    exit 1

}

    
validate_lab_name() {
    local target_lab="$1"
    if [[ ! -d "labs/$target_lab" ]]; then
        echo "Error: Lab '$target_lab' does not exist in labs/ directory" >&2
        exit 1
    fi
}
