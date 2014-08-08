FROM ragb/supervisor-serf-nginx
ADD start-serf.sh /start-serf.sh
ADD serf-join.sh /serf-join.sh

ADD supervisord-serf.conf /etc/supervisor/conf.d/supervisord-serf.conf


RUN chmod 755 /*.sh


EXPOSE 80
EXPOSE 443
EXPOSE 7946