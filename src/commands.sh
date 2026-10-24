#!/usr/bin/env bash
set -euo pipefail

# SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/src"

# PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

show_help() {
    echo "CyberLab is a environment where ethical hacker and web penitration testers can test Vunerable apps in a isolated Environment."
    echo "Usage: mycli [OPTIONS] [COMMAND]"
    echo ""
    echo "Options:"
    echo "  -h, --help     Show this help message and exit"
    echo "  -v, --version  Show version information and exit"
    echo ""
    echo "Commands:"
    echo ""
    echo "cyberlab                   	help to use cyberlab"
    echo "cyberlab list labs        	Show available practice labs"
	echo "cyberlab list-containers      Show containers running"
	echo "cyberlab up [lab_name]        Start the selected lab"
	echo "cyberlab up dvwa              Start the selected lab dvwa"
	echo "cyberlab status	            Show running services and health"
	echo "cyberlab logs	                Display relevant container logs"
	echo "cyberlab stop	               	Stop the lab without deleting its configuration"
	echo "cyberlab down	               	Stop the environment and remove its managed containers and network"
}

available_labs() {
    
	echo "Available Practice labs:"
    cd "$PROJECT_ROOT/labs"
    find . -mindepth 1 -maxdepth 1 -type d -exec basename {} \;

    }

list_all_containers() {

    if docker info >/dev/null 2>&1; then
        echo -e "docker not running"
        exit 1
    else
        sudo docker ps
    fi

}

