#!/bin/sh
set -e

log() {
  echo "[$(date '+%Y-%m-%dT%H:%M:%S%z')] $*"
}

if [ -n "$DEBUG" ]; then
  log "DEBUG: Starting database transform (DATABASE_URL is set: $( [ -n "$DATABASE_URL" ] && echo 'yes' || echo 'no' ))"
  log "DEBUG: Running: psql -f /app/transform.sql"
  output=$(psql "$DATABASE_URL" -f /app/transform.sql 2>&1)
  code=$?
  echo "$output" | while read -r line; do log "psql: $line"; done
  [ $code -ne 0 ] && log "DEBUG: Exited with code $code"
  [ $code -eq 0 ] && log "DEBUG: Completed successfully"
  exit $code
else
  psql "$DATABASE_URL" -f /app/transform.sql
fi
