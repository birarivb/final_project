FROM tomcat:9.0


RUN rm -rf /usr/local/tomcat/webapps/*


COPY app/ROOT.war /usr/local/tomcat/webapps/ROOT.war


EXPOSE 5000

CMD ["catalina.sh","run"]
