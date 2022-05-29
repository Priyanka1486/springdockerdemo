FROM openjdk:8-jdk-alpine
VOLUME /temp
ADD target/springdockerdemo-0.0.1-SNAPSHOT.jar projapp.jar
ENTRYPOINT ["java", "-jar","/projapp.jar"]