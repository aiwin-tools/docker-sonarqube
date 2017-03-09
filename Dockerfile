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

ENV OBJECTIVE_C_PLUGIN_VERSION 0.6.0
RUN set -x && curl -sLo $HOME/plugins/backelite-sonar-objective-c-plugin-${OBJECTIVE_C_PLUGIN_VERSION}.jar \
	https://github.com/Backelite/sonar-objective-c/releases/download/${OBJECTIVE_C_PLUGIN_VERSION}/backelite-sonar-objective-c-plugin-${OBJECTIVE_C_PLUGIN_VERSION}.jar

ENV SWIFT_PLUGIN_VERSION 0.3.2
RUN set -x && curl -sLo $HOME/plugins/backelite-sonar-swift-plugin-${SWIFT_PLUGIN_VERSION}.jar \
	https://github.com/Backelite/sonar-swift/releases/download/${SWIFT_PLUGIN_VERSION}/backelite-sonar-swift-plugin-${SWIFT_PLUGIN_VERSION}.jar

ENV ANDROID_LINT_PLUGIN_VERSION 1.1
RUN set -x && curl -sLo $HOME/plugins/sonar-android-plugin-${ANDROID_LINT_PLUGIN_VERSION}.jar \
	https://github.com/SonarQubeCommunity/sonar-android/releases/download/${ANDROID_LINT_PLUGIN_VERSION}/sonar-android-plugin-${ANDROID_LINT_PLUGIN_VERSION}.jar

# End Plugins

RUN cp $HOME/plugins/* $SONARQUBE_HOME/extensions/plugins
