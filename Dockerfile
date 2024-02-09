FROM maven:3.9.6-eclipse-temurin-17-focal AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

FROM openjdk:17-jdk-slim
WORKDIR /app
COPY --from=build /app/target/spring-log4j-jul-1.0-SNAPSHOT.war .

CMD ["java", \
    "-Djava.util.logging.manager=org.apache.logging.log4j.jul.LogManager", \
    "-Dcom.sun.management.jmxremote.authenticate=false", \
    "-Dcom.sun.management.jmxremote", \
    "-Dcom.sun.management.jmxremote.port=17100", \
    "-jar", "spring-log4j-jul-1.0-SNAPSHOT.war"]