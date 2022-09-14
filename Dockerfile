FROM php:apache

#RUN apt update && apt install wget
#RUN wget https://download.dokuwiki.org/src/dokuwiki/dokuwiki-stable.tgz
COPY dokuwiki-stable.tgz ./

RUN mkdir -p /var/www/html/wiki
RUN tar xf dokuwiki-stable.tgz --strip-components=1 -C /var/www/html/wiki

COPY data.tar.xz /tmp/
RUN cd /tmp && tar -xf data.tar.xz
RUN cp -r /tmp/data/pages/* /var/www/html/wiki/data/pages/
RUN cp -r /tmp/data/media/* /var/www/html/wiki/data/media/

# readonly for visitors
COPY conf/* /var/www/html/wiki/conf/

RUN chown -R www-data.www-data /var/www/html/wiki
RUN rm dokuwiki-stable.tgz
RUN rm -rf /tmp/data*
