FROM gcr.io/google_appengine/nodejs

MAINTAINER John Hamilton <john@isnapapps.com>



## Package set up
#RUN /usr/bin/npm install socket.io && /usr/bin/npm install redis && /usr/bin/npm install ioredis && /usr/bin/npm install redis-notifier
#RUN /usr/bin/npm install --silent rebound-server --save
#RUN npm dedupe

##### ADD SUPERVISOR config

#COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf


WORKDIR /app/

COPY ./app /app/

RUN npm --unsafe-perm install


EXPOSE 3000
