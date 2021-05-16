# FROM docker.elastic.co/elasticsearch/elasticsearch:7.12.1@sha256:561bf27aa989803bfbac48ebd48e32daadb4215cf7940c599a62c13f225427fa
FROM container-registry.console.klovercloud.com/klovercloud/elasticsearch:7.12.1

COPY bin/docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod 0775 /usr/local/bin/docker-entrypoint.sh

COPY bin/kcinit.sh /kcinit.sh
RUN chmod +x /kcinit.sh

RUN mkdir -p /tmp-elasticsearch
RUN cp -ar /usr/share/elasticsearch/. /tmp-elasticsearch/.
RUN rm -rf /usr/share/elasticsearch
RUN mkdir -p /usr/share/elasticsearch