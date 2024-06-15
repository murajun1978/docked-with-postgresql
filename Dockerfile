FROM ghcr.io/rails/cli:latest

ARG POSTGRESQL_VERSION=16

RUN apt-get update -qq \
  && apt-get install --no-install-recommends -y \
  lsb-release \
  libpq-dev \
  curl \
  ca-certificates  \
  && echo "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list \
  && cat /etc/apt/sources.list.d/pgdg.list \
  && curl -sS https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - \
  && apt-get update \
  && apt-get install -y postgresql-client-$(POSTGRESQL_VERSION) \
  && apt-get clean \
  && rm --recursive --force /var/lib/apt/lists/*
