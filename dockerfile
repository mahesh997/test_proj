FROM maven
WORKDIR opt/app/
EXPOSE 8080
copy . .
RUN mvn clean package && cp ./target/*.jar opt/app/file.jar
ENTRYPOINT ["java","-jar","app.jar"]
