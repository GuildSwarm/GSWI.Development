#!/bin/bash

ROLE_NAME="asp_net" 
psql -U "$POSTGRES_USER" -t -c "SELECT 1 FROM pg_roles WHERE rolname = '$ROLE_NAME'" | grep -q 1 || psql -U "$POSTGRES_USER" -c "CREATE ROLE \"$ROLE_NAME\" WITH LOGIN PASSWORD '$POSTGRES_PASSWORD';"



