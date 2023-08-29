FROM quay.io/keycloak/keycloak:18.0.0
WORKDIR /tmp
COPY docker-entrypoint.sh test.sh

ENTRYPOINT ["/tmp/test.sh" ]