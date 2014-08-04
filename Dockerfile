FROM dockerfile/nginx
# Get serf
ADD https://dl.bintray.com/mitchellh/serf/0.6.3_linux_amd64.zip /serf.zip
RUN unzip /serf.zip
RUN mv serf /usr/bin/serf
RUN rm /serf.zip

ADD start-serf.sh /start-serf.sh
ADD serf-join.sh /serf-join.sh

RUN apt-get install -qy supervisor
ADD supervisord-nginx.conf /etc/supervisor/conf.d/supervisord-nginx.conf
ADD supervisord-serf.conf /etc/supervisor/conf.d/supervisord-serf.conf

ADD run.sh /run.sh

RUN chmod 755 /*.sh

EXPOSE 80
EXPOSE 7946
CMD ["/run.sh"]