<p align="center">
  <img src="https://raw.githubusercontent.com/RouHim/killing-floor-2-container-image/main/.github/readme/logo.png" width="250">
</p>

<p align="center">
    <a href="https://github.com/RouHim/killing-floor-2-container-image/actions/workflows/pipeline.yml"><img src="https://github.com/RouHim/killing-floor-2-container-image/actions/workflows/pipeline.yml/badge.svg?branch=main" alt="Pipeline"></a>
    <a href="https://github.com/RouHim/killing-floor-2-container-image/actions/workflows/scheduled-security-audit.yaml"><img src="https://github.com/RouHim/killing-floor-2-container-image/actions/workflows/scheduled-security-audit.yaml/badge.svg?branch=main" alt="Pipeline"></a>
    <a href="https://hub.docker.com/r/rouhim/killing-floor-2-server"><img src="https://img.shields.io/docker/pulls/rouhim/killing-floor-2-server.svg" alt="Docker Hub pulls"></a>
    <a href="https://hub.docker.com/r/rouhim/killing-floor-2-server"><img src="https://img.shields.io/docker/image-size/rouhim/killing-floor-2-server" alt="Docker Hub size"></a>
    <a href="https://github.com/aquasecurity/trivy"><img src="https://img.shields.io/badge/trivy-protected-blue" alt="trivy"></a>
    <a href="https://hub.docker.com/r/rouhim/killing-floor-2-server/tags"><img src="https://img.shields.io/badge/ARCH-amd64-blueviolet" alt="os-arch"></a>
    <a href="https://buymeacoffee.com/rouhim"><img alt="Donate me" src="https://img.shields.io/badge/-buy_me_a%C2%A0coffee-gray?logo=buy-me-a-coffee"></a>
</p>

<p align="center">
    This repository provides a <a href="https://github.com/RouHim/killing-floor-2-container-image/actions/workflows/scheduled-security-audit.yaml">safe</a> container image for the <a href="https://store.steampowered.com/agecheck/app/232090/">Killing Floor 2</a> game server. 
  It is designed to be used with Docker Compose, making it easy to set up and manage your game server environment.
</p>

## Requirements

* [Docker](https://docs.docker.com/engine/install/)
* [Docker Compose](https://docs.docker.com/compose/install/standalone/)
* At least 1GB RAM

## Installation

Once _Docker_ and _Docker Compose_ are installed, clone this repository to your local machine:

```bash
git clone https://github.com/RouHim/killing-floor-2-container-image.git
cd killing-floor-2-container-image
```

Before starting the server, create the required folder structure, and adjust the permissions:

```bash
mkdir data/ 
chmod 777 data/
```

> The `chmod` command is recommended to avoid permission issues.
> The main reason is, that the user in the container, most likely differs from the user on the host.

## Usage

To start the Killing Floor 2 server, navigate to the cloned repository's directory and use Docker Compose:

```bash
docker-compose pull
docker-compose up -d
```

This will pull the latest image and start the server in detached mode.

When starting the server for the first time:

* The config files and folders will be automatically created in the `config/` folder.
* The server will download the latest version of the game from Steam to the `data/` folder.

> You have to restart after the first start.

To restart the server after making changes to the configuration, use the following command:

```bash
docker-compose restart
```

In order to check the server logs, use the following command:

```bash
docker-compose logs -f
```

## Configuration

The server configuration does not differ from the official server configuration.
Just follow an existing server configuration guide
like [this](https://wiki.killingfloor2.com/index.php?title=Dedicated_Server_(Killing_Floor_2)#Game_Modes).

The `data` folder contains the game server data.
Any modification to the server configuration should be done when the server is stopped.
Otherwise, the changes will be most likely overwritten.

# Resources

- Built from: https://github.com/RouHim/killing-floor-2-container-image
- Built to: https://hub.docker.com/r/rouhim/killing-floor-2-server
- SteamCMD Documentation: https://developer.valvesoftware.com/wiki/SteamCMD
- Dedicated server guide: https://wiki.killingfloor2.com/index.php?title=Dedicated_Server_(Killing_Floor_2)
