FROM quay.io/keycloak/keycloak:18.0.0

COPY docker-entrypoint.sh /opt

ENTRYPOINT [ "/opt/docker-entrypoint.sh" ]
CMD ["-b", "0.0.0.0"]
