#!/bin/bash

set -e

echo "Waking up the pond..."

UPDATE_QUERY="
UPDATE species_catalog 
SET croaks = croaks + 1 
WHERE frog_id = (
    SELECT frog_id 
    FROM species_catalog 
    ORDER BY random() 
    LIMIT 1
);"

PGPASSWORD="$PGPASSWORD" psql \
    -h "$PGHOST" \
    -U "$PGUSER" \
    -p "$PGPORT" \
    -d "$PGDATABASE" \
    -c "$UPDATE_QUERY"

echo "Success! A random frog has croaked."