FROM php:7.3-stretch
LABEL maintainer "Matt Burgess <matt.burgess92@googlemail.com>"

RUN apt-get update -y && apt-get upgrade -y

# Install dependencies
RUN apt-get install -y \
    $PHPIZE_DEPS \
    libmagickwand-dev \
    libtool \
    libxml2-dev \
    bash \
    libcurl3-dev \
    curl \
    g++ \
    gcc \
    git \
    imagemagick \
    libc-dev \
    libpng-dev \
    libjpeg-dev \
    make \
    mysql-client \
    nodejs \
    yarn \
    openssh-client \
    rsync \
    libzip-dev \
    sqlite3 \ 
    pdftk \
    unzip \
    zip

# Install pecl-only extensions
RUN pecl install \
    imagick \
    xdebug \
    mongodb

RUN docker-php-ext-configure zip --with-libzip
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/
RUN docker-php-ext-install \
    curl \
    iconv \
    mbstring \
    pdo \
    pdo_mysql \
    pcntl \
    tokenizer \
    xml \
    gd \
    zip \
    bcmath

# Enable pecl extensions
RUN docker-php-ext-enable \
    imagick \
    xdebug \
    mongodb

# Install NPM
RUN curl -sL https://deb.nodesource.com/setup_10.x > setup_10.x \
    && chmod +x setup_10.x \
    && ./setup_10.x \
    && apt-get install -y nodejs

# Install composer
ENV COMPOSER_HOME /composer
ENV PATH ./vendor/bin:/composer/vendor/bin:$PATH
ENV COMPOSER_ALLOW_SUPERUSER 1
RUN curl -s https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin/ --filename=composer

# Cleanup dependencies only used for compilation
RUN apt-get autoremove -y $PHPIZE_DEPS \
    libtool \
    g++ \
    gcc \
    libc-dev

# Setup working directory
WORKDIR /var/www
