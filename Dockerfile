FROM adoptopenjdk/openjdk11:x86_64-ubuntu-jre-11.0.3_7

RUN apt-get update && apt-get install -y tzdata && \
ln -fs /usr/share/zoneinfo/Asia/Seoul /etc/localtime && \
dpkg-reconfigure -f noninteractive tzdata

RUN rm /usr/bin/curl
VOLUME /tmp

COPY build/libs/*.jar app.jar

RUN useradd -m deploy
RUN install -o deploy -g deploy -d daum
RUN usermod --shell /usr/sbin/nologin deploy

USER deploy

EXPOSE 8080

ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:///dev/urandom \
 -XX:MaxMetaspaceSize=1024m -XX:MetaspaceSize=1024m -Dsun.net.inetaddr.ttl=0 \
 -Dsun.net.inetaddr.ttl=0 -Dcom.sun.management.jmxremote \
 -Dcom.sun.management.jmxremote.port=8999 -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.ssl=false \
 -jar /app.jar" ]