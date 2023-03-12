FROM php:8-fpm-alpine

EXPOSE 9000

ENTRYPOINT ["docker-php-entrypoint", "php-fpm"]
