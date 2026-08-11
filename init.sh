#!/bin/sh
set -eu

psql -v ON_ERROR_STOP=1 \
  --username "$POSTGRES_USER" \
  --dbname "$POSTGRES_DB" \
  -v studio26f_db_pass="$STUDIO26F_DB_PASS" \
  -v techrater_db_pass="$TECHRATER_DB_PASS" \
  -f /docker-entrypoint-initdb.d/init_users.sql.tpl