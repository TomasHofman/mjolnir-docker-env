FROM jboss/base-jdk:8

ADD kerberos-using-apacheds.jar /opt/jboss/
ADD users.ldif /opt/jboss/

EXPOSE 10389 6088/udp

CMD java -Dkerberos.bind.address=0.0.0.0 -jar kerberos-using-apacheds.jar users.ldif