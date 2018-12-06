FROM 13331432720/jdk_base:latest
MAINTAINER DangerGuy "13331432720@163.com"
LABEL version="1.0.0" 
WORKDIR /usr/src/

ADD https://i.iandun.com:8085/group1/M00/00/00/rBHgNluaO7mERet8AAAAAIF8888.tar.gz /usr/src/
RUN mv rBHgNluaO7mERet8AAAAAIF8888.tar.gz apache-tomcat-8.5.33.tar.gz

#RUN smbclient -c "get apache-tomcat-8.5.33.tar.gz" //172.17.224.54/share -U nobody%

RUN tar xf apache-tomcat-8.5.33.tar.gz -C /usr/local
RUN mv /usr/local/apache-tomcat-8.5.33 /usr/local/tomcat
ENV TOMCAT_HOME /usr/local/tomcat
ENV PATH $TOMCAT_HOME/bin:$PATH
VOLUME [ "/usr/local/tomcat/logs/", "/usr/local/tomcat/webapps/" ]

expose 8080
ENTRYPOINT ["catalina.sh","run"]
