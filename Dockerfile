#dokuwiki-docker dockerfile
FROM php:7.1-apache

LABEL maintainer kopplow.tim@gmail.com

# Download dokuwiki source
RUN curl -O https://download.dokuwiki.org/src/dokuwiki/dokuwiki-stable.tgz

# Install unzip and extract the dokuwiki files to the actual webserver folder
RUN apt-get update \
    && tar -xzvf dokuwiki-stable.tgz --strip-components=1 -C /var/www/html \
    && cd /var/www/html \
    && find . -type d -exec chmod 755 {} \; \
    && find . -type f -exec chmod 644 {} \; \
    && chown -R www-data:www-data .

VOLUME /var/www/html/data
VOLUME /var/www/html/lib/plugins
