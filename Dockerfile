FROM debian:trixie

RUN apt-get update && \
    apt-get install -y postfix libsasl2-modules mailutils opendkim opendkim-tools && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY conf/main.cf /etc/postfix/main.cf

EXPOSE 25
CMD ["postfix", "start-fg"]