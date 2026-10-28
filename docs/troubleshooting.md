# Troubleshooting Guide

Common issues when deploying CyberLab targets and how to solve them quickly.

## 1. Unbound Variable Error ($2: unbound variable)
* **Symptom:** Running commands like `cyberlab logs` or `cyberlab up` without passing a lab name crashes the script with line execution errors.
* **Reason:** Strict bash checks are failing on empty arguments.
* **Fix:** Open the main entry script and ensure all second arguments use safe defaults like `${2:-}` instead of plain `$2`.

## 2. Invalid Compose Project (Variable Not Set)
* **Symptom:** Running `cyberlab down <lab>` says image variables are not set and rejects the compose configuration.
* **Reason:** Docker Compose cannot find the environment variables used during deployment when trying to stop them.
* **Fix:** Ensure the `containers_down()` function in your script includes the explicit `--env-file` parameter pointing to your config:
  `docker compose --env-file "$CONFIG_FILE" -f "$lab_path/compose.yaml" down`

## 3. Pull Access Denied / Repository Not Found
* **Symptom:** Running `cyberlab up ad-simulator` fails to download images from Docker Hub.
* **Reason:** Active Directory tools do not provide public pre-made images on Docker Hub and must be compiled locally.
* **Fix:** 
  1. Open `labs/ad-simulator/compose.yaml`.
  2. Change the service descriptor to use local building blocks (`build: .`) instead of the `image:` keyword string.

## 4. Permission Denied Errors
* **Symptom:** Communication failures with the Docker daemon.
* **Reason:** Your current user account does not belong to the local system docker security group.
* **Fix:** Prefix your runner workflow commands using administrative context, or add your user directly to the docker group layout:
  `sudo ./cyberlab up dvwa`
