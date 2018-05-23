FROM ubuntu:16.04

RUN apt-get update
RUN apt-get install default-jdk -y
RUN useradd -r tomcat9 --shell /bin/false
RUN apt-get install wget iputils-ping -y
RUN cd /opt && \
    wget http://archive.apache.org/dist/tomcat/tomcat-9/v9.0.0.M22/bin/apache-tomcat-9.0.0.M22.tar.gz && \
    tar -zxf apache-tomcat-9.0.0.M22.tar.gz && \
    ln -s apache-tomcat-9.0.0.M22 tomcat && \
    chown -hR tomcat9: tomcat apache-tomcat-9.0.0.M22

RUN rm -r /opt/tomcat/webapps/ROOT
RUN wget --quiet https://broyal.blob.core.windows.net/mta/mta-java.war && \
    cp mta-java.war /opt/tomcat/webapps/ROOT.war

ENV CATALINA_PID /opt/tomcat/tomcat9.pid
ENV JAVA_HOME /usr/lib/jvm/java-1.8.0-openjdk-amd64
ENV CATALINA_HOME /opt/tomcat
ENV CATALINA_BASE /opt/tomcat
ENV CATALINA_OPTS "-Xms512m -Xmx512m"
ENV JAVA_OPTS "-Dfile.encoding=UTF-8 -Dnet.sf.ehcache.skipUpdateCheck=true -XX:+UseConcMarkSweepGC -XX:+CMSClassUnloadingEnabled -XX:+UseParNewGC"
EXPOSE 8080
CMD /opt/tomcat/bin/catalina.sh run
