
FROM java

COPY ./target/springdockerdemo-0.0.1-SNAPSHOT.jar dockerDemo.jar


EXPOSE 8080

ENTRYPOINT ["java","-jar","dockerDemo.jar"]

