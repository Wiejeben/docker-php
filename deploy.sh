#!/bin/sh

# Build images
docker build -t wiejeben/php:5.4 5.4
docker build -t wiejeben/php:5.5 5.5
docker build -t wiejeben/php:5.6 5.6
docker build -t wiejeben/php:7.0 7.0
docker build -t wiejeben/php:7.1 7.1
docker build -t wiejeben/php:7.2 7.2

docker push wiejeben/php