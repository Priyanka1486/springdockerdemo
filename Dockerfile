FROM openjdk:8-jre-alpine
EXPOSE 8080
VOLUME /temp
WORKDIR /springdockerdemo

FROM maven:3.5-jdk-8-alpine
RUN mvn install 
ADD pom.xml /springdockerdemo/pom.xml  
RUN ["mvn", "dependency:resolve"]  
RUN ["mvn", "verify"]

# Adding source, compile and package into a fat jar
ADD src /springdockerdemo/src  
RUN ["mvn", "package"]

ADD target/springdockerdemo-0.0.1-SNAPSHOT.jar app.jar
ENTRYPOINT ["java", "-jar","/app.jar"]

