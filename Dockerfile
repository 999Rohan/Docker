FROM maven AS maven-build
WORKDIR /app
COPY . /app
COPY ./libraries /root/.m2
RUN mvn --version
RUN mvn clean package -Dmaven.test.skip=true


FROM tomcat:8.0-alpine
RUN rm -rf /usr/local/tomcat/webapps/ROOT
COPY --from=maven-build /app/target/calculator.war /usr/local/tomcat/webapps/calculataor.war
EXPOSE 8080
CMD ["catalina.sh","run"]
