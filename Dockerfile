FROM alpine
WORKDIR /opt/app
EXPOSE 8080
COPY ./target/*.jar /opt/app/app.jar
ENTRYPOINT ["java","-jar","app.jar"]
