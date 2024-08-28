# my first image
ARG alpine_version=latest
FROM alpine:${alpine_version} AS base
ARG buildno=1

#RUN apk add openjdk17

WORKDIR /
WORKDIR app
WORKDIR build
# / + app + build = /app/build

#RUN touch test.txt && echo "Hello World" >> test.txt
#RUN apk add openjdk17
#RUN cd .. \
#    && wget https://dlcdn.apache.org/tomcat/tomcat-10/v10.1.19/bin/apache-tomcat-10.1.19.tar.gz \
#    && tar -xvzf apache-tomcat-10.1.19.tar.gz \
#    && rm apache-tomcat-10.1.19.tar.gz

#RUN touch test.txt && echo "Hello World" >> test.txt
#RUN apk add openjdk17
#RUN cd .. \
#    && wget https://dlcdn.apache.org/tomcat/tomcat-10/v10.1.28/bin/apache-tomcat-10.1.28-windows-x64.zip \
#    && expand apache-tomcat-10.1.28-windows-x64.zip

#
COPY .idea idea-new
# *
COPY .idea/*.xml idea-new-xml/
COPY apache-tomcat-10.1.28 /app/apache-tomcat-10.1.28
#COPY apache-tomcat-10.1.28 /app

#COPY tomcat.tar.gz /app
#ADD https://dlcdn.apache.org/tomcat/tomcat-10/v10.1.19/bin/apache-tomcat-10.1.19.tar.gz tomcat-add.tar.gz

FROM alpine:latest
RUN apk add openjdk17
COPY --from=base /app/apache-tomcat-10.1.28 /app/apache-tomcat-10.1.28

EXPOSE 8080
# entrypoint - to run executable
ENTRYPOINT ["/app/apache-tomcat-10.1.19/bin/catalina.sh"]
# cmd - to add params for prev executable
CMD ["run"]
# /app/apache-tomcat-10.1.19/bin/catalina.sh run -p debug











