FROM zzrot/alpine-node

MAINTAINER John Hamilton <john@isnapapps.com>


###### SET UP BASE STUFF

RUN apk add --update \
    supervisor \
  && rm -rf /var/cache/apk/*


##### ADD SUPERVISOR config

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf


#### MAKE LOG FOLDER

RUN /bin/mkdir -p /server/logs


#### NPM INSTALL OUR REBOUND SERVER

RUN npm install --silent rebound-server
RUN npm dedupe


#### CHANGE TO WORKDIR

WORKDIR /server


#### Run the command

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]


EXPOSE 3000
