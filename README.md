# CyberLab

CyberLab is an isolated playground where ethical hackers and web penetration testers can practice on vulnerable web applications safely without risking external exposure.

## Architecture

User CLI -> Controller -> Lab Config -> Docker Engine -> Practice App & Verification

1. User interacts via the custom Bash CLI.
2. Controller verifies system pre-requisites and handles internal port allocation.
3. Lab Config manages isolated internal docker networks and health parameters.
4. Docker Engine provisions identical environment copies utilizing hard-pinned SHA256 hashes.

## Installation

```bash
git clone https://github.com/ritixu/cyberlab
cd cyberlab
chmod +x cyberlab
sudo ln -s "\$(pwd)/cyberlab" /usr/local/bin/cyberlab
```

## Commands & Usage

### General Options
- `-h, --help`     Show the help interface menu.
- `-v, --version`  Display active tool engine versions.

### Core Operations
- `cyberlab list labs`       Display all available target vulnerabilities.
- `cyberlab up <lab_name>`   Deploy and launch an isolated target environment.
- `cyberlab status`          Show live deployments, container stability, and dynamic connection URLs.
- `cyberlab logs <lab_name>` Print the last 20 runtime output layers for troubleshooting.
- `cyberlab stop <lab_name>` Pause execution states without discarding local configurations.
- `cyberlab down <lab_name>` Safely purge active containers and delete isolated lab bridges.

## Examples

Start a Damn Vulnerable Web Application environment:
```bash
cyberlab up dvwa
```

Check what dynamic port it landed on:
```bash
cyberlab status
```

Destroy the environment completely when finished:
```bash
cyberlab down dvwa
```

## Security Note
All target web applications deployed inside this core run on isolated virtual internal network bridges (`internal: true`). They cannot route traffic out to the real internet, preventing any malicious scanner noise from escaping your local workspace.
