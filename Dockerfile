FROM h0tbird/confd:v0.11.0-1

VOLUME /config

ENTRYPOINT ["/run.sh"]

ADD ./bootstrap /etc/confd/bootstrap
ADD ./templates /etc/confd/templates
RUN mkdir /etc/confd/conf.d

ADD run.sh /run.sh
