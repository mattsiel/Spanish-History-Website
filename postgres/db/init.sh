#!/bin/bash

echo "*** CREATING DATABASE ***"

psql -U $POSTGRES_USER -d $POSTGRES_DB -a -f /app/db/dump.sql