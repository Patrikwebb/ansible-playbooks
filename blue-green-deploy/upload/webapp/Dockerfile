FROM jboss/wildfly

ENV POSTGRESQL_VERSION 9.4.1212

COPY ./wildfly/postgresql-${POSTGRESQL_VERSION}.jar $JBOSS_HOME/modules/system/layers/base/org/postgresql/main/
COPY ./wildfly/module.xml $JBOSS_HOME/modules/system/layers/base/org/postgresql/main/

RUN sh -c "$JBOSS_HOME/bin/standalone.sh &" && \
    sleep 10 && \
    $JBOSS_HOME/bin/jboss-cli.sh --connect --command="/subsystem=datasources/jdbc-driver=postgresql-driver:add(driver-class-name=org.postgresql.Driver, driver-module-name=org.postgresql, driver-name=postgresql-driver)" && \
    $JBOSS_HOME/bin/jboss-cli.sh --connect --command="data-source add --connection-url=jdbc:postgresql://some-postgres/postgres --driver-name=postgresql-driver --name=PostgresDS --jndi-name=java:/PostgresDS --user-name=postgres" && \
    $JBOSS_HOME/bin/jboss-cli.sh --connect --command=:shutdown

COPY ./target/webapp-0.0.1-SNAPSHOT.war $JBOSS_HOME/standalone/deployments/
COPY ./wildfly/*.properties $JBOSS_HOME/standalone/configuration/

RUN rm -Rf /opt/jboss/wildfly/standalone/configuration/standalone_xml_history/current/*
