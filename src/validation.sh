#!/usr/bin/env bash

check_prerequisites() {
    if ! command -v docker &> /dev/null; then
        echo "Error: Docker is not installed!" >&2
        exit 1
    fi
}

validate_lab_name() {
    local target_lab="$1"
    if [[ ! -d "labs/$target_lab" ]]; then
        echo "Error: Lab '$target_lab' does not exist in labs/ directory" >&2
        exit 1
    fi
}
