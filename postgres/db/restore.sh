
#enters backups folder 
cd ../
cd backups

files=(./*.sql)

PS3='Select backup to restore, or 0 to exit: '
select file in "${files[@]}"; do

    if [[ $REPLY == "0" ]]; then
        echo 'Bye!'
        exit
    elif [[ -z $file ]]; then
        echo 'Invalid choice, try again'
    else
        latest=$file
        break
    fi
done


cat $latest | docker exec -i postgres-ibe psql -h localhost -p 4000 -U matt -d postgres
cd ../