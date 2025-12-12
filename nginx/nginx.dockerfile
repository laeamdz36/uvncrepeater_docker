FROM nginx:1.29.3-perl

COPY ./novnc /var/www/novnc

COPY ./nginx.conf /etc/nginx/nginx.conf