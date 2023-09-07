FROM quay.io/keycloak/keycloak-x:latest

COPY docker-entrypoint.sh /opt/keycloak

ENTRYPOINT ["sh","/opt/keycloak/docker-entrypoint.sh"]
