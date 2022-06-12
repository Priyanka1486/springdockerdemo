FROM openjdk:8-jdk-alpine
EXPOSE 8080
VOLUME /temp
WORKDIR /springdockerdemo

RUN apt-get update  
RUN apt-get install -y maven
ADD pom.xml /springdockerdemo/pom.xml  
RUN ["mvn", "dependency:resolve"]  
RUN ["mvn", "verify"]

# Adding source, compile and package into a fat jar
ADD src /springdockerdemo/src  
RUN ["mvn", "package"]

ADD target/springdockerdemo-0.0.1-SNAPSHOT.jar app.jar
ENTRYPOINT ["java", "-jar","/app.jar"]