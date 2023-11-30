FROM php:8.1.5-fpm-alpine

ENV GROUP_ID=1000 \
    USER_ID=1000
    
WORKDIR /var/www/html

RUN apk add --no-cache \
	freetype-dev \
        libpng-dev \
        libjpeg-turbo-dev \
        libwebp-dev \
        libxpm-dev \
        libzip-dev \
        icu-dev \
    && docker-php-ext-configure gd --with-freetype \
    # && docker-php-ext-install gd zip intl pdo_mysql
    && docker-php-ext-install gd zip intl mysqli pdo_mysql

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN addgroup -g $GROUP_ID www
RUN adduser -D -u $USER_ID -G www www -s /bin/sh

USER www
