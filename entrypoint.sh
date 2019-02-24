#!/bin/bash
set -e

# Remove pid if exists
rm -f /ik/tmp/pids/server.pid

# exec containers main proc (set as CMD in Dockerfile)
exec "$@"
