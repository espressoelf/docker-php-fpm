FROM php:7.4.23-fpm-bullseye

ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

RUN chmod +x /usr/local/bin/install-php-extensions && sync && \
    apt update && apt install -y --no-install-recommends libpcre16-3 libpcre3-dev libpcre32-3 libpcrecpp0v5 && \
    pecl update-channels && \
    pecl install oauth-2.0.7 && \
    pear install Services_JSON && \
    docker-php-ext-enable oauth && \
    apt remove -y libpcre16-3 libpcre3-dev libpcre32-3 libpcrecpp0v5 && \
    install-php-extensions apcu bcmath bz2 exif gd gettext intl mcrypt mysqli opcache pcntl pdo_mysql redis sockets uuid zip && \
    apt install --no-install-recommends imagemagick ffmpeg && \
    rm -r /var/lib/apt/lists/*
    
