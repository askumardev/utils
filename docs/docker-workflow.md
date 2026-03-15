# 🐳 Docker Commands Guide

This document provides basic commands for installing and using Docker, along with useful troubleshooting commands.

---

# 📚 Table of Contents

- [Docker Installation](#docker-installation)
- [Docker Version Check](#docker-version-check)
- [Pulling and Running Docker Images](#pulling-and-running-docker-images)
- [Docker Image and Container Commands](#docker-image-and-container-commands)
- [System Commands for Debugging](#system-commands-for-debugging)
- [Executing Commands Inside Containers](#executing-commands-inside-containers)
- [Node.js Cleanup Commands](#nodejs-cleanup-commands)

---

# Docker Installation

Remove old Docker versions:

```bash
sudo apt-get remove docker docker-engine docker.io
```

Update system packages:

```bash
sudo apt-get update
```

Install Docker using apt:

```bash
sudo apt install docker.io
```

Install Docker using snap:

```bash
sudo snap install docker
```

If snap is not available:

```bash
sudo apt purge snapd
sudo apt install snapd
sudo snap install docker
```

Alternative installation:

```bash
sudo apt-get install docker
```

---

# Docker Version Check

Verify Docker installation:

```bash
docker --version
```

---

# Pulling and Running Docker Images

Pull and run a test container:

```bash
docker pull hello-world
docker run hello-world
```

Pull nginx image:

```bash
docker pull nginx
```

Run nginx container interactively:

```bash
docker run -it nginx
```

Run nginx container in detached mode:

```bash
docker run -itd nginx
```

---

# Docker Image and Container Commands

Show Docker help:

```bash
docker
```

List downloaded images:

```bash
docker images
```

List running containers:

```bash
sudo docker ps
```

List all containers:

```bash
sudo docker ps -a
```

---

# System Commands for Debugging

Check current directory:

```bash
pwd
```

Locate Docker binary:

```bash
which docker
```

Check running processes:

```bash
ps -ef
```

Check Docker processes:

```bash
ps -ef | grep docker
```

---

# Network Commands

Check network interfaces:

```bash
ifconfig
```

Show IP addresses:

```bash
ip -a
```

Detailed network information:

```bash
ip addr show
```

---

# Executing Commands Inside Containers

Open bash shell inside running container:

```bash
docker exec -it <container_id> bash
```

Example:

```bash
docker exec -it e6fd9cbeda6c bash
```

---

# Node.js Cleanup Commands

These commands remove Node.js installations and related files from the system.

```bash
sudo rm -rf /usr/local/bin/npm

sudo rm -rf /usr/local/share/man/man1/node*

sudo rm -rf /usr/local/lib/dtrace/node.d

rm -rf ~/.npm

rm -rf ~/.node-gyp

sudo rm -rf /opt/local/bin/node

sudo rm -rf /opt/local/include/node

sudo rm -rf /opt/local/lib/node_modules

sudo rm -rf /usr/local/lib/node*

sudo rm -rf /usr/local/include/node*

sudo rm -rf /usr/local/bin/node*
```

---

# 💡 Tips

- Use `docker ps -a` to see stopped containers.
- Use `docker images` to view downloaded images.
- Use `docker exec` to access a running container.
- Always verify installation using `docker --version`.

---

