# Custom Image Build

There is always a scenario where the default pulled image does not satisfy the requirements of our usecase.

We will consider 2 such scenarios below

- Full Featured and Optimised Postgres Image
- Simulated Cloud Postgres like AWS RDS

```bash

podman build --no-cache --file ./Containerfile.postgres14_bullseye --force-rm --tls-verify --tag kasichennupati/postgres14_bullseye_local
# localhost/kasichennupati/postgres14_bullseye_local:latest

```
