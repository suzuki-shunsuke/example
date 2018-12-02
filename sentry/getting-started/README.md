# sentry on docker

https://github.com/docker-library/docs/tree/master/sentry

```sh
docker-compose up -d redis postgres
```

```sh
docker run --rm sentry:9.0.0 config generate-secret-key
```

Set SENTRY_SECRET_KEY.

```sh
vi docker-compose.yml
```

Uncomment out migrate-postgres and migrate postgress.

```sh
# uncomment out migrate-postgres
vi docker-compose.yml
docker-compose up migrate-postgres
```

Stop and remove and comment out migrate-postgres.

```sh
docker-compose stop migrate-postgres
docker-compose rm migrate-postgres
# comment out migrate-postgres
vi docker-compose.yml
```

Run sentry and cron and worker.

```sh
docker-compose up -d sentry
docker-compose up -d cron
docker-compose up -d worker
```

Create initial user.

```sh
docker-compose exec sentry bash
sentry createuser
```
