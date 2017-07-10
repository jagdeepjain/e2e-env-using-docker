FROM jetty
ADD target/app.war /var/lib/jetty/webapps/root.war
EXPOSE 8080

