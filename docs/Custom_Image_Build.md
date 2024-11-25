# Custom Image Build

There is always a scenario where the default pulled image does not satisfy the requirements of our usecase.

We will consider 2 such scenarios below

- Full Featured and Optimised Postgres Image
- Simulated Cloud Postgres like AWS RDS

The Container images always we will aim to use the latest release of postgres and base os image variants as possible. 

But,
> Stability comes first.

__Postgres 14 and Bullseye__

```bash
podman build \
--no-cache \
--force-rm \
--tls-verify \
--file ./versions/Containerfile.postgres14_bullseye \
--tag kasichennupati/postgres14_bullseye_local:dev-v1
```

The below upgrades the base image for the postgres data base so when migrating it's best to do a build of the image and upgrade in this manner.
__Postgres 14 and Bookworm__

```bash
podman build \
--no-cache \
--force-rm \
--tls-verify \
--file ./versions/Containerfile.postgres14_bookworm \
--tag kasichennupati/postgres14_bookworm_local:dev-v1
```
