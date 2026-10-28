# Installation Guide

Follow these steps to set up CyberLab on your local machine.

## Prerequisites
Before installing, ensure your system has the following dependencies:
- Linux (Ubuntu/Debian recommended)
- Bash shell
- Docker Engine
- Docker Compose v2

## Step 1: Clone the Repository
Clone the project from GitHub and navigate to the directory:
```bash
git clone https://github.com
cd cyberlab
```

## Step 2: Make the Script Executable
Give the main entry script execution permissions:
```bash
chmod +x cyberlab
```

## Step 3: Global Installation (Optional)
To run the `cyberlab` command from anywhere on your system without typing `./`, link it to your system path:
```bash
sudo ln -s "\$(pwd)/cyberlab" /usr/local/bin/cyberlab
```

## Step 4: Verify the Setup
Run the script to check if the prerequisites validation passes:
```bash
cyberlab -v
```
