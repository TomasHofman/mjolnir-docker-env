FROM jboss/wildfly:10.0.0.Final

# enable management
RUN /opt/jboss/wildfly/bin/add-user.sh -u admin -p Admin#123 --silent

ADD *.cli /opt/jboss/

# configure PostgreSQL datasource
RUN curl -O https://jdbc.postgresql.org/download/postgresql-9.4.1208.jar \
    && /opt/jboss/wildfly/bin/jboss-cli.sh --file=/opt/jboss/setup-datasource.cli \
    && rm postgresql-9.4.1208.jar

# configure SSL
ADD server.keystore /opt/jboss/
RUN /opt/jboss/wildfly/bin/jboss-cli.sh --file=/opt/jboss/setup-ssl.cli

# configure kerberos
ADD krb5.conf /etc/krb5.conf
#ENV java.security.krb5.conf /opt/jboss/krb5.conf

EXPOSE 9990 8443 8787

CMD ["/opt/jboss/wildfly/bin/standalone.sh", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0", "--debug"]
