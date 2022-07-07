FROM postgres:12 as db
WORKDIR /sql

RUN mkdir -p /db/

COPY ./db/dump.sql ./db/dump.sql
COPY ./db/init.sh /docker-entrypoint-initdb.d