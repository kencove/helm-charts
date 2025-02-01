# Grist Helm Chart

This Helm chart deploys the Grist application along with its dependencies: PostgreSQL, Redis, and Minio.

## Prerequisites

- Kubernetes 1.19+
- Helm 3.0+

## Installation

To install the chart with the release name `my-release`:

```sh
helm install my-release /path/to/chart -f values.yaml
```

## Features

This Helm chart includes the following features:

- **Replicas**: Configure the number of replicas for the Grist application.
- **Image**: Specify the Docker image and tag for the Grist application.
- **Resources**: Define resource requests and limits for the Grist pods.
- **Ingress**: Enable and configure ingress for the Grist application.
- **Service**: Configure the service type and ports for the Grist application.
- **Persistence**: Enable and configure persistent storage for the Grist application.
- **Environment Variables**: Set environment variables for the Grist application.
- **PostgreSQL**: Deploy and configure a PostgreSQL database for Grist.
- **Redis**: Deploy and configure a Redis instance for Grist.
- **Minio**: Deploy and configure a Minio instance for Grist.

## Configuration

The following table lists the configurable parameters of the Grist chart and their default values.

| Parameter                         | Description                                     | Default                                   |
|-----------------------------------|-------------------------------------------------|-------------------------------------------|
| `fullnameOverride`                | String to fully override `grist.fullname`       | `""`                                      |
| `grist.image`                     | Grist image repository                          | `gristlabs/grist`                         |
| `grist.tag`                       | Grist image tag                                 | `v1.3.3`                                  |
| `grist.persistence.enabled`       | Enable persistence using PVC                    | `false`                                   |
| `grist.persistence.size`          | Size of persistent volume claim                 | `10Gi`                                    |
| `grist.persistence.storageClass`  | Storage class of backing PVC                    | `""`                                      |
| `grist.env.GRIST_POSTGRESQL_URL`  | PostgreSQL connection URL                       | `postgresql://grist:gristpassword@postgresql:5432/gristdb` |
| `grist.env.GRIST_REDIS_URL`       | Redis connection URL                            | `redis://:redispassword@redis:6379`       |
| `grist.env.GRIST_MINIO_URL`       | Minio connection URL                            | `http://minio:9000`                       |
| `grist.env.GRIST_MINIO_ACCESS_KEY`| Minio access key                                | `minio`                                   |
| `grist.env.GRIST_MINIO_SECRET_KEY`| Minio secret key                                | `miniosecret`                             |
| `postgresql.enabled`              | Enable PostgreSQL                               | `true`                                    |
| `postgresql.postgresqlUsername`   | PostgreSQL username                             | `grist`                                   |
| `postgresql.postgresqlPassword`   | PostgreSQL password                             | `gristpassword`                           |
| `postgresql.postgresqlDatabase`   | PostgreSQL database name                        | `gristdb`                                 |
| `redis.enabled`                   | Enable Redis                                    | `true`                                    |
| `redis.password`                  | Redis password                                  | `redispassword`                           |
| `minio.enabled`                   | Enable Minio                                    | `true`                                    |
| `minio.accessKey`                 | Minio access key                                | `minio`                                   |
| `minio.secretKey`                 | Minio secret key                                | `miniosecret`                             |
| `ingress.enabled`                 | Enable ingress                                  | `false`                                   |
| `ingress.annotations`             | Annotations for the ingress                     | `{}`                                      |
| `ingress.hosts`                   | List of ingress hosts                           | `[{"host": "grist.local", "paths": ["/"]}]`|
| `ingress.tls`                     | TLS configuration                               | `[]`                                      |

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example:

```sh
helm install my-release /path/to/chart --set grist.image=gristlabs/grist,grist.tag=v1.3.3
```

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For example:

```sh
helm install my-release /path/to/chart -f values.yaml
```