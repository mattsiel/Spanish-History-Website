echo $PGUSER
echo "db"
echo $PGDATABASE
psql -U mattsii -d ibe-db -a -f /app/db/startup.sql