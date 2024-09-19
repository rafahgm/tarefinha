FROM php:8.3-fpm-alpine

COPY ./docker/zzz.conf /usr/local/etc/php-fpm.d/zzz.conf

RUN apk add --no-cache postgresql-dev && \
docker-php-ext-install pdo pdo_pgsql

RUN apk add --no-cache pcre-dev $PHPIZE_DEPS \
&& pecl install redis \
&& docker-php-ext-enable redis.so

CMD ["php-fpm", "-R"]
