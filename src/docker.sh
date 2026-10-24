#!/usr/bin/env bash


deploy_lab_compose() {
    if [[ -z "${1:-}" ]]; then
        echo -e "Error: 'up' requires a service name (e.g, juice-shop, dvwa)!" >&2
        exit 1
    fi
    local lab_path="$2"
    echo "Spinning up Docker Compose environment..."
    docker compose -f "$lab_path/compose.yaml" up -d
}

containers_down() {
    if [[ -z "${1:-}" ]]; then
        echo -e "Error: 'down' requires a service name (e.g, juice-shop, dvwa)!" >&2
        exit 1
    fi
    local lab_path="$1"
    echo "Tearing down Docker Compose environment..."
    docker compose -f "$lab_path/compose.yaml" down
}


display_logs() {

    if [[ -z "${1:-}" ]]; then
        echo -e "Error: 'logs' requires a service name (e.g., juice-shop, dvwa)!" >&2
        exit 1
	fi
	LAB_NAME="$1"
    DYNAMIC_NAME="cyberlab-$LAB_NAME"
	echo "Displaying Logs"
	docker logs --tail=20 "$DYNAMIC_NAME" 2>/dev/null || echo "No logs were found."
	
}

stop_container() {

    if [[ -z "${1:-}" ]]; then
        echo -e "Error: 'stop' requires a service name (e.g., juice-shop, dvwa)!" >&2
        exit 1
	fi
	local lab_path "$1"
	echo "Displaying Logs"
	docker compose -f "$lab_path/compose.yaml" stop
	


}