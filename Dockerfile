FROM quay.io/keycloak/keycloak:18.0.0

COPY docker-entrypoint.sh /test/test.sh

RUN ./test/test.sh