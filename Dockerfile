FROM quay.io/wildfly/wildfly:27.0.0.Final-jdk11

ARG JAVA_OPTS="-server -Xms512m -Xmx2048m -XX:MetaspaceSize=96M -XX:MaxMetaspaceSize=256m -XX:+UseAdaptiveSizePolicy -XX:MaxMetaspaceSize=1024m -Djava.net.preferIPv4Stack=true -Djboss.modules.system.pkgs=org.jboss.byteman -Djava.awt.headless=true-Djava.net.preferIPv4Stack=true"
ENV JAVA_OPTS=$JAVA_OPTS

USER root
RUN groupmod -g 2001 jboss  && \
    usermod -u 2001 -g 2001 jboss

RUN mkdir -p /var/lib/jboss/drivers  && \
    chown -R jboss:jboss /var/lib/jboss/drivers/ && \
    mkdir -p /var/lib/jboss/scripts/ && \
    chown -R jboss:jboss /var/lib/jboss/scripts/


USER jboss

EXPOSE 8080 9081 9443 9990

WORKDIR /var/lib/jboss/scripts
