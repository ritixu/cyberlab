#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

CONFIG_FILE="$PROJECT_ROOT/labs/labs.conf"

deploy_lab_compose() {
    if [[ -z "${1:-}" ]]; then
        echo -e "Error: 'up' requires a service name (e.g, juice-shop, dvwa)!" >&2
        exit 1
    fi
    local lab_path="$1"
    
    local lab_name
    lab_name=$(basename "$lab_path")

    echo "Spinning up Docker Compose environment..."
    
    docker compose --env-file "$CONFIG_FILE" -f "$lab_path/compose.yaml" -p "cyberlab-$lab_name" up -d
}

containers_down() {
    if [[ -z "${1:-}" ]]; then
        echo "Error: 'down' requires a service name (e.g, juice-shop, dvwa)!" 
        exit 1
    fi
    
    local lab_path="$1"
    local lab_name
    lab_name=$(basename "$lab_path")

    echo "Tearing down Docker Compose environment..."
    sudo docker compose --env-file "$CONFIG_FILE" -f "$lab_path/compose.yaml" -p "cyberlab-$lab_name" down

}

display_logs() {
    if [[ -z "${1:-}" ]]; then
        echo -e "Error: 'logs' requires a service name (e.g., juice-shop, dvwa)!" >&2
        exit 1
    fi
    local lab_name="$1"
    local dynamic_name="cyberlab-$lab_name"

    echo "Displaying Logs:"
    docker logs --tail=20 "$dynamic_name" 2>/dev/null || echo "No logs were found for $dynamic_name."
}

stop_container() {
    if [[ -z "${1:-}" ]]; then
        echo -e "Error: 'stop' requires a service name (e.g., juice-shop, dvwa)!" >&2
        exit 1
    fi
    local lab_path="$1"
    local lab_name
    lab_name=$(basename "$lab_path")

    echo "Stopping Docker Compose containers..."
    sudo docker compose --env-file "$CONFIG_FILE" -f "$lab_path/compose.yaml" -p "cyberlab-$lab_name" stop


}
