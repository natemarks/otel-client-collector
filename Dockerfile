FROM otel/opentelemetry-collector-contrib:0.10.0
MAINTAINER Imprivata CloudOps <cortext.ng.cloudops@imprivata.com>

# Add informational labels to the build for traceability
# This section of code must be replicated and kept in sync across each of our
# Dockerfiles. If Docker adds an "INCLUDE" command, we will be able to abstract
# this out into a single separate file. See CNG-2034 for more information.
ARG BUILD_DATETIME
ARG BUILD_DOCKER_VERSION
ARG BUILD_HOST
ARG BUILD_USER
ARG CONTAINER_NAME
ARG GIT_BRANCH
ARG GIT_COMMIT
ARG GIT_REPO
LABEL com.imprivata.docker.$CONTAINER_NAME.build_datetime=$BUILD_DATETIME \
      com.imprivata.docker.$CONTAINER_NAME.build_docker_version=$BUILD_DOCKER_VERSION \
      com.imprivata.docker.$CONTAINER_NAME.build_host=$BUILD_HOST \
      com.imprivata.docker.$CONTAINER_NAME.build_user=$BUILD_USER \
      com.imprivata.docker.$CONTAINER_NAME.git_branch=$GIT_BRANCH \
      com.imprivata.docker.$CONTAINER_NAME.git_commit=$GIT_COMMIT \
      com.imprivata.docker.$CONTAINER_NAME.git_repository=$GIT_REPO


ENV OTLP_RECEIVER_ENDPOINT="0.0.0.0:14268"
ENV ZIPKIN_RECEIVER_ENDPOINT="0.0.0.0:9411"
ENV SFX_EXPORTER_ACCESS_TOKEN="INVALID ACCESS TOKEN"
ENV SFX_EXPORTER_ENDPOINT="https://ingest.us1.signalfx.com/v2/trace"
ENV PPROF_EXTENSION_ENDPOINT="0.0.0.0:1777"
ENV ZPAGES_EXTENSION_ENDPOINT="0.0.0.0:55679"

EXPOSE 1777 9411 13133 55671 55681

ADD otel-collector-config.yml /etc/otel-collector-config.yml