# Postgres Container Run Setup

## Launching the container

The focus of the containerisation platform is podman so the below command is tailored to reflect the same.

## Single Container Simple Setup

```bash

podman run \
--replace \
--detach \
--name postgres14_bullseye_container \
--cidfile "./.container_id" \
--publish 54331:5432 \
--tz "Etc/UTC" \
--env "POSTGRES_USER=postgres" \
--env "POSTGRES_PASSWORD=postgres_password" \
--env "POSTGRES_DB=postgres" \
--env "POSTGRES_REPLICATION_USER=pg_replication_user" \
--env "POSTGRES_REPLICATION_PASSWORD=pgreplicationpassword" \
localhost/kasichennupati/postgres14_bullseye_local:latest

```

## Multiple Container and Complex Setup

```bash

podman-compose --project-name local_databases --file podman-compose.yml up --detach

```

The above command will launch a Podman __POD__ unlike a kubernetes pod and will use the podman-compose.yml file in the path where this command is run.

Usually when the __up__ is run meaning please start the container we will see the container logs in the console we launched on. __--detach__ parameter lets the podman-compose program know that please don't tie the current terminal console with the container.

This launches the container silently by outputting the launched contianer id
