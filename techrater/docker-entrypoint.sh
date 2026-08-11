#!/bin/sh
set -eu

envsubst '${TECHRATER_DB_PASS} ${TECHRATER_ADMIN_TOKEN}' \
  < /opt/techrater/config.json.template > /opt/techrater/config.json

exec "$@"