# CyberLab Architecture Documentation

CyberLab is a modular, containerized deployment framework designed for ethical hackers and penetration testers to run vulnerable applications in isolated environments.


## Structural System Overview

The application follows a decoupled component design, splitting input parsing, environment validation, configuration storage, and container orchestration into separate, independent modules.

```text
                  ┌───────────────────────┐
                  │    User CLI Input     │
                  │   (./bin/cyberlab)    │
                  └───────────┬───────────┘
                              │
                              ▼
                  ┌───────────────────────┐
                  │  Command Dispatcher   │
                  │  (src/commands.sh)    │
                  └───────────┬───────────┘
                              │
            ┌─────────────────┴─────────────────┐
            ▼                                   ▼
┌───────────────────────┐           ┌───────────────────────┐
│  Validation Engine    │           │  Health & Readiness   │
│  (src/validation.sh)  │           │   (src/health.sh)     │
└───────────┬───────────┘           └───────────────────────┘
            │
            ▼
┌───────────────────────┐           ┌───────────────────────┐
│    Docker Core Engine │           │     Lab Blueprints    │
│    (src/docker.sh)    │ ◄──────── │    (labs/ [lab]/)     │
└───────────┬───────────┘           └───────────────────────┘
            │
            ▼
┌───────────────────────────────────────────────────────────┐
│                Target Sandbox Environments                │
│       [ cyberlab-juice-shop ]    [ cyberlab-dvwa ]        │
└───────────────────────────────────────────────────────────┘
```



## Repository Directory Layout

```text
├── bin/
│   └── cyberlab             # Main CLI entry point (argument loop parsing)
├── src/
│   ├── commands.sh          # Orchestrates menu functions and user interactions
│   ├── docker.sh            # Lower-level Docker Compose execution wrappers
│   ├── health.sh            # Global container health checks and status mappings
│   └── validation.sh        # Prerequisite environment checking and path safety loops
└── labs/
    ├── juice-shop/
    │   └── compose.yaml     # Isolated container configuration map for Juice Shop
    └── dvwa/
        └── compose.yaml     # Isolated container configuration map for DVWA
```

---

## Component Lifecycle Roles

### 1. Main Entry Point (`bin/cyberlab`)
* Captures raw runtime flags (`$1`, `$2`) using a shifting conveyor belt layout.
* Handles global configuration paths (`$PROJECT_ROOT`).
* Loads core code modules into memory space via the `source` utility.

### 2. Validation Engine (`src/validation.sh`)
* Asserts system readiness (verifies if the Docker engine binary is actively running).
* Implements directory checking logic (`[[ -d ... ]]`) to ensure target assets exist before execution.

### 3. Docker Controller Engine (`src/docker.sh`)
* Exposes clean, structural abstractions (`containers_up`, `containers_down`).
* Evaluates directory configurations dynamically using the `-f` flag (`docker compose -f path/to/compose.yaml`).

### 4. Configuration Storage Blueprints (`labs/`)
* Holds zero application script code.
* Uses isolated YAML definitions containing precise image versions, labels, networks, and distinct network configurations to prevent port clashes.

---

## Interface Reference Suite

### Options
* `-h, --help` : Show help definitions and exit.
* `-v, --version` : Show application build tracking and exit.

### Core Commands
* `list` : Scan and print available training laboratories found on disk.
* `list-containers` : Filter and display running assets deployed by the tool framework.
* `up [lab_name]` : Pull images and provision a targeted laboratory deployment in the background.
* `status` : Run structured diagnostic state maps across all deployed assets.
* `logs [lab_name]` : Fetch the last 20 runtime output streams from a specific environment.
* `stop [lab_name]` : Pause execution threads without purging user storage layers or challenges.
* `down [lab_name]` : Strip container allocations, discard state values, and clear virtual network mappings.
