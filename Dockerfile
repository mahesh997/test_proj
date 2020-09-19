FROM alpine
WORKDIR /opt/app
EXPOSE 8080
COPY 'C:/Program Files (x86)/Jenkins/workspace/DevPipelineJob/target/*.jar' /opt/app/app.jar
ENTRYPOINT ["java","-jar","app.jar"]
