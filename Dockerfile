FROM jboss/wildfly:10.0.0.Final
LABEL maintainer="Zonya"

# BUILD STEPS (mvn, ant...) - optional

WORKDIR /opt/jboss/wildfly/standalone/deployments/
COPY virtual-classroom.war /opt/jboss/wildfly/standalone/deployments/

EXPOSE 8080
CMD ["/opt/jboss/wildfly/bin/standalone.sh", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0"]
