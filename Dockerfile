FROM quay.io/keycloak/keycloak:18.0.0

COPY docker-entrypoint.sh /opt

WORKDIR /opt

CMD ["docker-entrypoint.sh"]