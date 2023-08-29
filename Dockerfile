FROM quay.io/keycloak/keycloak:18.0.0
WORKDIR /tmp
COPY docker-entrypoint.sh /tmp/test.sh

ENTRYPOINT ["sh","/tmp/test.sh"]