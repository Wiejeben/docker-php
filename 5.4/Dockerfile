FROM cytopia/php-fpm-5.4

# Setup working directory
RUN mkdir /srv/app
WORKDIR /srv/app

# Copy scripts and configuration
COPY php.ini /usr/local/etc/php/conf.d/php-default.ini

CMD ["php-fpm"]
