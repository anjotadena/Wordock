#!/bin/bash

echo "Updating Wordock services..."

# Pull the latest images
docker pull nginx:latest
docker pull php:8.2-fpm
docker pull mysql:8.0
docker pull mailhog/mailhog

# Restart services
docker-compose down --volumes --remove-orphans
docker-compose up -d

echo "Wordock updated and running!"
echo "WordPress: http://localhost:${WP_PORT}"
echo "WordPress: https://localhost:${WP_PORT_HTTPS}"
echo "MailHog: http://localhost:8025"
