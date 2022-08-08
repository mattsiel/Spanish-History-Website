FROM quay.io/keycloak/keycloak:latest

COPY ./my-realm.json /tmp/my-realm.json

ENV KEYCLOAK_USER admin
ENV KEYCLOAK_PASSWORD admin

ENV KEYCLOAK_IMPORT /tmp/my-realm.json