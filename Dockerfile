
FROM maven:3.5-jdk-8-alpine
WORKDIR /app
COPY --from=0 /app/springdockerdemo /app 
RUN mvn install 

EXPOSE 8080
FROM openjdk:8-jre-alpine
WORKDIR /app
COPY --from=1 /app/target/springdockerdemo-0.0.1-SNAPSHOT.jar /app 
CMD ["java -jar springdockerdemo-0.0.1-SNAPSHOT.jar"]



#ADD target/springdockerdemo-0.0.1-SNAPSHOT.jar app.jar
#ENTRYPOINT ["java", "-jar","/app.jar"]

