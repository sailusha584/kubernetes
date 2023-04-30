FROM ubuntu
RUN apt-get update
RUN apt-get install -y nginx
COPY index.html /var/www/html

COPY start.sh /root/start.sh
EXPOSE 81

ENTRYPOINT /root/start.sh

