#!/usr/bin/env bash
set -euo pipefail

health_status() {

    echo "Cyberlab Deployments"
		local lab_list
		lab_list=$(docker ps -a --filter "name=cyberlab-" --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}" 2>/dev/null || true)
				
		# Check if we found any labs (ignoring the table header row)
		if [[ $(echo "$lab_list" | wc -l) -le 1 ]]; then
			echo "No active or deployed labs found. Run './cyberlab up [lab-name]' to start one."
		else
			echo "$lab_list"
		fi
}