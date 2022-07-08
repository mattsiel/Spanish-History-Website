FROM postgres:12 as ibe-db
WORKDIR /app


COPY ./db/init.sh /docker-entrypoint-initdb.d
COPY ./db/startup.sql ./db/startup.sql