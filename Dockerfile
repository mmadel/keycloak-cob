FROM quay.io/keycloak/keycloak:18.0.2

COPY docker-entrypoint.sh /opt/keycloak

ENTRYPOINT ["sh","/opt/keycloak/docker-entrypoint.sh"]
