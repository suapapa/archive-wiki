FROM php:apache

#RUN apt update && apt install wget
#RUN wget https://download.dokuwiki.org/src/dokuwiki/dokuwiki-stable.tgz
COPY dokuwiki-stable.tgz ./
RUN mkdir -p /var/www/html/wiki
RUN tar xf dokuwiki-stable.tgz --strip-components=1 -C /var/www/html/wiki

COPY dokuwiki-plugin-googleads-1.0.1.tar.gz ./
RUN mkdir -p /var/www/html/wiki/lib/plugins/googleads
RUN tar xf dokuwiki-plugin-googleads-1.0.1.tar.gz --strip-components=1 -C /var/www/html/wiki/lib/plugins/googleads
COPY main.php /var/www/html/wiki/lib/tpl/dokuwiki/main.php
COPY local_pref.php /var/www/html/wiki/lib/plugins/googleads/local_pref.php

COPY data.tar.xz /tmp/
RUN cd /tmp && tar -xf data.tar.xz
RUN cp -r /tmp/data/pages/* /var/www/html/wiki/data/pages/
RUN cp -r /tmp/data/media/* /var/www/html/wiki/data/media/

# readonly for visitors
COPY conf/*.php /var/www/html/wiki/conf/
# url prefix setting
COPY conf/001-wiki.conf /etc/apache2/sites-enabled/000-default.conf

RUN chown -R www-data.www-data /var/www/html/wiki

RUN rm *.tgz
RUN rm *.tar.gz
RUN rm -rf /tmp/data*
