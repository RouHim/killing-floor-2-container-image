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

Configuration via environment variables is also possible:

| Name                                   | Description                                                                       | Example                          | Default value            |
|----------------------------------------|-----------------------------------------------------------------------------------|----------------------------------|--------------------------|
| `KF2_SERVER_NAME`                      | Server name                                                                       | `My Server`                      | `Killing Floor 2 Server` |
| `KF2_SERVER_SUBSCRIBED_WORKSHOP_ITEMS` | Workshop items to subscribe to                                                    | `123456789`                      |                          |
| `KF2_WEB_ADMIN_ENABLED`                | Enable web admin                                                                  | `true`                           | `false`                  |
| `KF2_WEB_ADMIN_PASSWORD`               | Web admin password                                                                | `password`                       |                          |
| `KF2_DISABLE_TEAM_COLLISION`           | Disable team collision                                                            | `true`                           | `false`                  |
| `KF2_USED_FOR_TAKEOVER`                | Used for takeover                                                                 | `true`                           | `false`                  |
| `KF2_BANNER_LINK`                      | Banner link                                                                       | `https://example.com/banner.jpg` |                          |
| `KF2_SERVER_MOTD`                      | Server message of the day                                                         | `Welcome to my server!`          |                          |
| `KF2_CLAN_MOTTO`                       | Clan motto                                                                        | `My clan motto`                  |                          |
| `KF2_NET_SERVER_MAX_TICK_RATE`         | Maximum tick rate                                                                 | `30`                             | `30`                     |
| `KF2_MAX_INTERNET_CLIENT_RATE`         | Maximum internet client rate                                                      | `30`                             | `30`                     |
| `FAST_BOOT`                            | If set to `true`, the server will not be installed / updated / validated on start | `true`                           | `false`                  |

# Resources

- Built from: https://github.com/RouHim/killing-floor-2-container-image
- Built to: https://hub.docker.com/r/rouhim/killing-floor-2-server
- SteamCMD Documentation: https://developer.valvesoftware.com/wiki/SteamCMD
- Official dedicated server guide: https://wiki.killingfloor2.com/index.php?title=Dedicated_Server_(Killing_Floor_2)
- Advanced dedicated server guide: https://steamcommunity.com/sharedfiles/filedetails/?id=1110775580
- Another server guide: https://steamcommunity.com/sharedfiles/filedetails/?id=1110775580
- Killing Floor 2 Server Tool: https://github.com/darkdks/KF2ServerTool
