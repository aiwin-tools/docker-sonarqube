FROM sonarqube:lts-alpine

MAINTAINER Javier Boo "javier.boo@aiwin.es"

RUN mkdir -p $HOME/plugins

# Plugins
ENV GITLAB_PLUGIN_VERSION 1.7.0
RUN set -x && curl -sLo $HOME/plugins/sonar-gitlab-plugin-${GITLAB_PLUGIN_VERSION}.jar \
	http://nexus.talanlabs.com/content/groups/public_release/com/synaptix/sonar-gitlab-plugin/${GITLAB_PLUGIN_VERSION}/sonar-gitlab-plugin-${GITLAB_PLUGIN_VERSION}.jar

ENV HIPCHAT_PLUGIN_VERSION 0.2
RUN set -x && curl -sLo $HOME/plugins/sonar-hipchat-plugin-${HIPCHAT_PLUGIN_VERSION}.jar \
	https://github.com/dbac2002/sonar-hipchat-plugin/releases/download/${HIPCHAT_PLUGIN_VERSION}/sonar-hipchat-plugin-${HIPCHAT_PLUGIN_VERSION}.jar

RUN cp $HOME/plugins/* $SONARQUBE_HOME/extensions/plugins
