#!/bin/bash
set -eou pipefail

# usage: file_env VAR [DEFAULT]
#    ie: file_env 'XYZ_DB_PASSWORD' 'example'
# (will allow for "$XYZ_DB_PASSWORD_FILE" to fill in the value of
#  "$XYZ_DB_PASSWORD" from a file, especially for Docker's secrets feature)
file_env() {
  local var="$1"
  local CONFIG_MARKER_FILE="${var}_FILE"
  local def="${2:-}"
  if [[ ${!var:-} && ${!CONFIG_MARKER_FILE:-} ]]; then
    echo >&2 "error: both $var and $CONFIG_MARKER_FILE are set (but are exclusive)"
    exit 1
  fi
  local val="$def"
  if [[ ${!var:-} ]]; then
    val="${!var}"
  elif [[ ${!CONFIG_MARKER_FILE:-} ]]; then
    val="$(<"${!CONFIG_MARKER_FILE}")"
  fi

  if [[ -n $val ]]; then
    export "$var"="$val"
  fi

  unset "$CONFIG_MARKER_FILE"
}

##############################
# Set admin user credentials #
##############################



################################################
# Set database config from Heroku DATABASE_URL #ee
################################################
#https://regex101.com/r/uB8lA4/1
#if [ "$DATABASE_URL" != "" ]; then
#  echo "Found database configuration in DATABASE_URL=$DATABASE_URL"
#
#  regex='^mysql://([a-zA-Z0-9_-]+):([a-zA-Z0-9]+)@([a-z0-9.-]+)/([a-zA-Z0-9_-]+)'
#  if [[ $DATABASE_URL =~ $regex ]]; then
#    DB_ADDR=${BASH_REMATCH[3]}
#
#    DB_DATABASE=${BASH_REMATCH[4]}
#    DB_USER=${BASH_REMATCH[1]}
#    DB_PASSWORD=${BASH_REMATCH[2]}
#
#    echo "DB_ADDR=$DB_ADDR, DB_DATABASE=$DB_DATABASE, DB_USER=$DB_USER, DB_PASSWORD=$DB_PASSWORD"
##    export KC_DB_URL=jdbc:mysql//$DB_ADDR/$DB_DATABASE
##    export KC_DB_USERNAME=$DB_USER
##    export KC_DB_PASSWORD=$DB_PASSWORD
##    export KC_DB=mysql
#  fi
#fi
export KEYCLOAK_ADMIN=admin
export KEYCLOAK_ADMIN_PASSWORD=coB@10
export DB_SCHEMA=validate

##################
# Start Keycloak #
##################

CONFIG_ARGS=""
RUN_CONFIG_START=false
RUN_CONFIG=false
SERVER_OPTS="--http-port=$PORT --hostname-strict=false"

#if [ "$DB_ARGS" != "" ]; then
#  SERVER_OPTS="$SERVER_OPTS $DB_ARGS"
#fi

echo $KEYCLOAK_ADMIN
exec /opt/keycloak/bin/kc.sh start --http-port=$PORT --auto-build --db=mysql --proxy=edge --hostname-strict=false --hostname-strict-https=false --db-url jdbc:mysql://e764qqay0xlsc4cz.cbetxkdyhwsb.us-east-1.rds.amazonaws.com/lpwqvwws4deq0fkh --db-username et2fpdsy5wlwvmzg --db-password gpfkpdy2u94k546c

exit $?
