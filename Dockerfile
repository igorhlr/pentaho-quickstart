FROM ubuntu:22.04

ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
ENV PENTAHO_HOME=/opt/pentaho-server
ENV PENTAHO_JAVA_HOME=$JAVA_HOME

RUN apt-get update && \
    apt-get install -y openjdk-11-jdk wget unzip vim net-tools cron && \
    mkdir /opt/sharedFolder && \
    apt-get clean

COPY pentaho-server-ce-9.4.0.0-343.zip /opt/
COPY libs/mysql-connector-java-5.1.9.jar /opt/mysql-connector-java-5.1.9.jar
# COPY libs/mssql-jdbc-12.2.0.jre11.jar /opt/mssql-jdbc-12.2.0.jre11.jar
COPY libs/mysql-connector-java-8.0.23.jar /opt/mysql-connector-java-8.0.23.jar
COPY libs/mssql-jdbc-7.4.1.jre11.jar /opt/mssql-jdbc-7.4.1.jre11.jar

RUN unzip /opt/pentaho-server-ce-9.4.0.0-343.zip -d /opt && \
    rm /opt/pentaho-server-ce-9.4.0.0-343.zip && \
    mv /opt/mysql-connector-java-8.0.23.jar /opt/pentaho-server/tomcat/lib/ && \
    mv /opt/mssql-jdbc-7.4.1.jre11.jar /opt/pentaho-server/tomcat/lib/

COPY scripts/copy_logs.sh /opt/scripts/copy_logs.sh
RUN chmod +x /opt/scripts/copy_logs.sh

RUN echo "0 0 * * * /opt/scripts/copy_logs.sh" > /etc/cron.d/copy_logs && \
    chmod 0644 /etc/cron.d/copy_logs && \
    crontab /etc/cron.d/copy_logs

# Inicia o cron junto com o container
# CMD cron && bash

WORKDIR /opt/pentaho-server

EXPOSE 8080

CMD ["bash"]
# CMD cron && exec bash