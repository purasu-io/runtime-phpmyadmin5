FROM phpmyadmin:5.0.4

RUN set -eux; \
  apt-get update; \
  apt-get -yq install --no-install-recommends \
    libcap2-bin \
  ;

RUN set -eux; \
  setcap cap_net_bind_service=+ep /usr/sbin/apache2; \
  setcap -v cap_net_bind_service=+ep /usr/sbin/apache2;

COPY layer /

USER 10000

ENTRYPOINT [ "/entrypoint" ]
