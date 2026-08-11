#!/bin/sh
set -eu

envsubst '${STUDIO26F_DB_PASS} ${SMTP_SERVER} ${SMTP_ACCOUNT} ${SMTP_PASSWORD} ${SMTP_SENDER_EMAIL} ${SMTP_SENDER_NAME} ${STUDIO26F_OAUTH_SECRET} ${TECHRATER_ADMIN_TOKEN}' \
  < /opt/studio26f/config.json.template > /opt/studio26f/config.json

exec "$@"