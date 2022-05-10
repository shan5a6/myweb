FROM javawebapp:base
EXPOSE 8080
WORKDIR /opt/myapplication/
COPY . /opt/myapplication/
RUN mvn clean install && cp ./target/myweb-*.war /opt/tomcat/webapps/myapp.war
CMD ["/opt/tomcat/bin/catalina.sh", "run"]
