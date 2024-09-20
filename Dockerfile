#Ubuntu com Java 11
FROM openjdk:11-jdk

# unzip e vim
RUN apt-get update && apt-get install -y unzip vim && rm -rf /var/lib/apt/lists/*

COPY pentaho-server-ce-9.4.0.0-343.zip /opt/pentaho.zip

COPY libs/mysql-connector-java-5.1.9.jar /opt/mysql-connector-java-5.1.9.jar

RUN unzip /opt/pentaho.zip -d /opt/pentaho-server && rm /opt/pentaho.zip

EXPOSE 8080

CMD ["bash"]
