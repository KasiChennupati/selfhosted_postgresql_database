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

The above podman run command is constructed so we have good control and specification on the following 

- Containers Lifecyle
- Networking
- Environment variables
- Image

### Container lifecycle

|           Podman run param           |                        purpose for container                         |
| :----------------------------------: | :------------------------------------------------------------------: |
|              podman run              |                        start a new container.                        |
|              --replace               | if a container with the same --name already exists, remove it first. |
|               --detach               |                   run in background (daemonized).                    |
| --name postgres14_bullseye_container |                  container gets this explicit name.                  |
|     --cidfile "./.container_id"      |        write the container ID to a file named .container_id.         |

### Networking

Podman allows us to specify some platform level configuaration from a container level like time zone settng will impact with time zone it needs to get from nts servers.
Simillarly allows with specific port numbers can be mapped to the host for better multi container deployments and security.

| Networking specific Setting |     Purpose/Reason for Postgres Container      |
| :-------------------------: | :--------------------------------------------: |
|    --publish 54331:5432     | map host port 54331 to the container port 5432 |
|       --tz "Etc/UTC"        |    force the container to use UTC timezone     |

### Environment variables (for Postgres setup)

|                Environment Variable                 |                     Purpose/Reason for Postgres Container                     |
| :-------------------------------------------------: | :---------------------------------------------------------------------------: |
|               POSTGRES_USER=postgres                |                          default DB superuser name.                           |
|         POSTGRES_PASSWORD=postgres_password         |                         password for that superuser.                          |
|                POSTGRES_DB=postgres                 |                 default database to create on first startup.                  |
|    POSTGRES_REPLICATION_USER=pg_replication_user    | sets up a replication user (if the image is designed to support replication). |
| POSTGRES_REPLICATION_PASSWORD=pgreplicationpassword |                        password for replication user.                         |

### Image

We want to specify the specific image name and and it's specific image name with the tag id to pick for the container run.
`localhost/kasichennupati/postgres14_bullseye_local:latest`

## Multiple Container and Complex Setup

```bash

podman-compose --project-name local_databases --file podman-compose.yml up --detach

```

The above command will launch a Podman __POD__ unlike a kubernetes pod and will use the podman-compose.yml file in the path where this command is run.

Usually when the __up__ is run meaning please start the container we will see the container logs in the console we launched on. __--detach__ parameter lets the podman-compose program know that please don't tie the current terminal console with the container.

This launches the container silently by outputting the launched contianer id
