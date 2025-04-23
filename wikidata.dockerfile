FROM alpine:3

WORKDIR /tmp/data

# COPY nginx/src/ /var/www/html/
COPY dokuwiki-stable.tgz ./
# RUN mkdir -p /var/www/html/wiki
RUN tar xf dokuwiki-stable.tgz --strip-components=1 -C ./

COPY dokuwiki-plugin-googleads-1.0.1.tar.gz ./
RUN mkdir -p lib/plugins/googleads
RUN tar xf dokuwiki-plugin-googleads-1.0.1.tar.gz --strip-components=1 -C ./lib/plugins/googleads
COPY main.php ./lib/tpl/dokuwiki/main.php
COPY local_pref.php ./lib/plugins/googleads/local_pref.php

COPY data.tar.xz .
RUN tar -xf data.tar.xz

COPY ads.txt .

COPY inc/*.php ./inc/
# readonly for visitors
COPY conf/*.php ./conf/

RUN rm *.tgz *.tar.gz *.tar.xz
RUN chown -R 82:82 *

COPY copy-wikidata.sh /
RUN chmod +x /copy-wikidata.sh

CMD ["/copy-wikidata.sh"]

