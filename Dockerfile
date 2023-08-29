FROM quay.io/keycloak/keycloak:18.0.0

COPY docker-entrypoint.sh /opt

WORKDIR /opt/keycloak

RUN ./opt/docker-entrypoint.sh