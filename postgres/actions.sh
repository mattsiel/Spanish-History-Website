#!/bin/bash

set -o allexport
source ./.env
set +o allexport

echo " "

PS3='What action on the Database do you want to do : '
options=("Initialize" "Backup" "Restore" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Initialize")
            echo "you chose to initialize the tables without data"
            cd db
            echo " "
            sh init.sh
            cd ../
            ;;
        "Backup")
            echo "you chose to backup the data"
            cd db
            echo " "
            sh backup.sh
            cd ../
            ;;
        "Restore")
            echo "you chose to restore the data"
            cd db
            echo " "
            sh restore.sh
            cd ../
            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done