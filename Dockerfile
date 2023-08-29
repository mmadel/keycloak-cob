FROM quay.io/keycloak/keycloak:18.0.0

COPY docker-entrypoint.sh /opt/jboss/tools

WORKDIR /opt/jboss/keycloak

RUN ./bin/kc.sh config --db=postgres
