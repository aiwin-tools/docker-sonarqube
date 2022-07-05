FROM sonarqube:lts-alpine

MAINTAINER Javier Boo "javier.boo@aiwin.es"

RUN apk add --no-cache curl

RUN mkdir -p $HOME/plugins

# Plugins

ENV JAVA_PLUGIN_VERSION 7.9.0.28969
RUN set -x && curl -sLo $HOME/plugins/sonar-java-plugin-${JAVA_PLUGIN_VERSION}.jar \
	https://binaries.sonarsource.com/Distribution/sonar-java-plugin/sonar-java-plugin-${JAVA_PLUGIN_VERSION}.jar

# End Plugins

RUN cp $HOME/plugins/* $SONARQUBE_HOME/extensions/plugins
