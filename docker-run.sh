#!/bin/bash -e


# Port the nginx proxy runs on
LISTENING_PORT=5000
# Nginx requires a DNS resolver to resolve the mirrorlist domains
RESOLVER="8.8.8.8 8.8.4.4"
# Server name can be left as _ if you do not wish to configure it
SERVER_NAME="_"


./gen_static_conf.sh "${RESOLVER}" "${SERVER_NAME}" > ./nginx.conf

mkdir -p ./pkgs
chmod -R 770 ./pkgs
chown -R :101 ./pkgs

docker run -d \
           --rm \
           -p ${LISTENING_PORT}:80 \
           -v "$(pwd)/nginx.conf:/etc/nginx/nginx.conf" \
           -v "$(pwd)/pkgs:/var/www" \
           --name pacman-cache \
           nginx:stable-alpine