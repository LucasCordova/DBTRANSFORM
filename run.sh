#!/bin/sh
set -e

log() {
  echo "[$(date '+%Y-%m-%dT%H:%M:%S%z')] $*"
}

if [ -z "$TRANSFORM_SQL" ]; then
  log "ERROR: TRANSFORM_SQL variable is not set. Set it in Railway Variables with the SQL to run."
  exit 1
fi

if [ -n "$DEBUG" ]; then
  log "DEBUG: Starting database transform (DATABASE_URL is set: $( [ -n "$DATABASE_URL" ] && echo 'yes' || echo 'no' ))"
  output=$(printf '%s\n' "$TRANSFORM_SQL" | psql "$DATABASE_URL" 2>&1)
  code=$?
  echo "$output" | while read -r line; do log "psql: $line"; done
  [ $code -ne 0 ] && log "DEBUG: Exited with code $code"
  [ $code -eq 0 ] && log "DEBUG: Completed successfully"
  exit $code
else
  printf '%s\n' "$TRANSFORM_SQL" | psql "$DATABASE_URL"
fi
