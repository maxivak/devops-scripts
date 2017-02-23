FROM java:8-jre
MAINTAINER maxivak@gmail.com

WORKDIR /opt/youtrack

ENV YOUTRACK_VERSION 6.5.17057


###
RUN mkdir -p /youtrack /opt/youtrack/data /opt/youtrack/backup /opt/youtrack/bin

RUN wget -nv https://download.jetbrains.com/charisma/youtrack-$YOUTRACK_VERSION.jar -O /opt/youtrack/bin/youtrack-$YOUTRACK_VERSION.jar

RUN ln -s /opt/youtrack/bin/youtrack-$YOUTRACK_VERSION.jar /opt/youtrack/bin/youtrack.jar



###

EXPOSE 80

VOLUME ["/opt/youtrack/data/", "/opt/youtrack/backup/"]

ENTRYPOINT ["java", \
  "-Xmx1g", \
  "-XX:MaxMetaspaceSize=250m", \
  "-Duser.home=/opt/youtrack", \
  "-Ddatabase.location=/opt/youtrack/data", \
  "-Ddatabase.backup.location=/opt/youtrack/backup", \
  "-Djava.awt.headless=true", \
  "-Djavax.net.ssl.trustStore=/etc/ssl/certs/java/cacerts", \
  "-Djavax.net.ssl.trustStorePassword=changeit", \
  "-Djetbrains.youtrack.disableBrowser=true", \
  "-Djetbrains.youtrack.enableGuest=false", \
  "-Djetbrains.youtrack.disableCheckForUpdate=true", \
  "-Djava.security.egd=/dev/urandom", \
  "-jar", \
  "/opt/youtrack/bin/youtrack.jar", \
  "80" \
]