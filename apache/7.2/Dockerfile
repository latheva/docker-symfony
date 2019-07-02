FROM php:7.2-apache

WORKDIR /var/www

# Enable intl
RUN apt-get update && apt-get install -y zlib1g-dev libicu-dev g++
RUN docker-php-ext-install intl

# Install wget
RUN  apt-get update && apt-get install -y wget && rm -rf /var/lib/apt/lists/*

# Install php-soap
RUN apt-get update -y && apt-get install -y libxml2-dev && apt-get clean -y
RUN docker-php-ext-install soap

# Install mcrypt libpng
RUN apt-get update -y && apt-get install -y libmcrypt-dev libpng-dev
RUN pecl install mcrypt-1.0.1
RUN docker-php-ext-enable mcrypt

# Install mbstring
#RUN docker-php-ext-install mbstring

RUN rm -rf /var/lib/apt/lists/*

# Install gd
RUN docker-php-ext-install gd

# Install libsodium for argon2i encoder
RUN apt-get update && apt-get install libsodium-dev

RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd

# Install curl
RUN apt-get install -y libssl-dev libcurl4-openssl-dev pkg-config
#RUN docker-php-ext-install curl

# Install pgsql
RUN apt-get install -y libpq-dev
RUN docker-php-ext-install pgsql

# Install mysqli
RUN docker-php-ext-install mysqli

# Install pdo_pgsql
RUN docker-php-ext-install pdo_pgsql

# Install pdo_mysql
RUN docker-php-ext-install pdo_mysql

# Install sockets
RUN docker-php-ext-install sockets

# Install pcntl
RUN docker-php-ext-install pcntl

# Install ftp
RUN docker-php-ext-install ftp

# Install opcache
RUN docker-php-ext-install opcache

# Install zip
RUN docker-php-ext-install zip

# Install APCu and APC backward compatibility
RUN pecl install apcu \
    && pecl install apcu_bc-1.0.3 \
    && docker-php-ext-enable apcu --ini-name 10-docker-php-ext-apcu.ini \
    && docker-php-ext-enable apc --ini-name 20-docker-php-ext-apc.ini

# Install composer
RUN curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer

# Install Git
RUN apt-get update && apt-get install -y git && apt-get install -y git-ftp

# Install Wget
RUN apt-get update && apt-get install -y wget

# Install Vim
RUN apt-get update && apt-get install -y vim

# Install zip & unzip
RUN apt-get update && apt-get install -y zip && apt-get install -y unzip

# Install nodejs
# Removing /var/lib/apt/lists worked
RUN rm -rf /var/lib/apt/lists/
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get install nodejs -y

# Install yarn
RUN curl -o- -L https://yarnpkg.com/install.sh | bash


# **************** if you are need of SSL ******************* #
#           Add certs and conf folders in your project
#               Add these lines in your Dockerfile
#                 Beware of the directory path
# *********************************************************** #
#RUN mkdir -p /etc/apache2/external

#COPY ../../../certs/*  /etc/apache2/external/
#COPY ../../../conf/*.conf /etc/apache2/sites-enabled/

#RUN rm /etc/apache2/sites-enabled/000-default.conf
#RUN a2enmod ssl

#EXPOSE 80
#EXPOSE 443
# *********************************************************** #