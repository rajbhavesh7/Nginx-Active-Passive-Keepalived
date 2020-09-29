FROM ubuntu:16.04

RUN  apt-get update -y

RUN apt-get install keepalived nginx -y

COPY entrypoint.sh /entrypoint.sh

COPY keepalived.conf /etc/keepalived/keepalived.conf

RUN chmod +x /entrypoint.sh

CMD ["sh", "/entrypoint.sh"]
