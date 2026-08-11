#!/bin/sh
set -eu

envsubst '${STUDIO26F_DB_PASS} ${TECHRATER_DB_PASS}' \
  < /docker-entrypoint-initdb.d/init.sql.template \
  | psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB"