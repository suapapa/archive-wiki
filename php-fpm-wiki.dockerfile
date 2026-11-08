FROM php:8.5.12-fpm-alpine

RUN apk update && apk upgrade --no-cache

EXPOSE 9000

ENTRYPOINT ["docker-php-entrypoint", "php-fpm"]

