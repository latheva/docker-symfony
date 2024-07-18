FROM composer:2.7.7 AS composer
FROM node:latest AS node
FROM php:8.2-fpm

# Set working directory
WORKDIR /var/www/symfony

COPY --from=composer /usr/bin/composer /usr/bin/composer
COPY --from=node /usr/local/lib/node_modules /usr/local/lib/node_modules
COPY --from=node /usr/local/bin/node /usr/local/bin/node
RUN ln -s /usr/local/lib/node_modules/npm/bin/npm-cli.js /usr/local/bin/npm

RUN apt update
RUN apt install -y zlib1g-dev g++ git libicu-dev zip libzip-dev zip

RUN docker-php-ext-install intl opcache pdo pdo_mysql \
    && pecl install apcu \
    && bash

#RUN nvm install 18
#RUN node -v # should print `v20.15.1`
#RUN npm -v # should print `10.7.0`

RUN usermod -u 1000 www-data

# Expose port 9000 and start php-fpm server
EXPOSE 9001
CMD ["php-fpm"]