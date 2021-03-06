#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 -U $POSTGRES_USER <<-EOSQL
  GRANT ALL PRIVILEGES ON DATABASE "$POSTGRES_DB" TO "$POSTGRES_USER";
EOSQL

psql -v ON_ERROR_STOP=1 -U $POSTGRES_USER -d $POSTGRES_DB <<-EOSQL
    CREATE EXTENSION plv8;
    CREATE EXTENSION plls;
    CREATE EXTENSION plcoffee;
EOSQL
