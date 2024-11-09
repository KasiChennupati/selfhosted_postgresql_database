# Self Hosting Postgresql Database

## Overview

Many of the self hosting applications related to iventory, asset, wiki or even for a traditional web app development there is always a requirement to have a backend database. PostgresQL is often the most chosen opensource data base for the projects and for learning data base systems.

This repository is dedicated to hosting all required artifacts for running and hosting postgresql database locally in a containerised environment in a home server environment

> __Note:__ The repository is committed very often to capture the complete thought process of changes and additions.

## Prerequisites

There is a required preliminaries for this repository 

- Linux Operating System
- Podman Desktop
- Podman Compose

## Containerisation

Before deploying a container a base image is required.
For base images we will pick only the major postgres versions with base debian os flavour fixed for the most stable postgres and debian versions.

| Debain Version | Postgres Version |
| :------------: | :--------------: |
|  Bullseye 11   |        14        |
|  Bookwork 12   |        14        |

read more in [Containerisation.md](./docs/Containerisation.md)

### Build

```bash
podman build --file ./Containerfile.postgres14_bullseye  --tag kasichennupati/postgres14_bullseye_local
```

read more in [Custom_Image_Build.md](./docs/Custom_Image_Build.md)

### Run

```bash
podman-compose --project-name local_databases --file podman-compose.yml up --detach
```

read more in [Postgres_Container_Run_Setup.md](./docs/Postgres_Container_Run_Setup.md)

## References
