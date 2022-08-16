
#grabs ID from the container image
ID=$(docker inspect --format="{{.Id}}" postgres-ibe)

cd ../

#creates a back up in the backups
docker exec -i postgres-ibe pg_dump -c -p $PGPORT -U $PGUSER -d $PGDATABASE> backups/backup_`date +%d-%m-%Y"_"%H_%M_%S`.sql

echo "data has been placed in the backups folder"
