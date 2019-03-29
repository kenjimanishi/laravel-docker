#!/bin/bash
set -ue
cd `dirname $0`

if [ $# != 1 ]; then
    echo "[Please give a Laravel project name as an argument]"
    echo "e.g.) ./create-project.sh laravel-project-name"
    exit 1
fi

if [ -f .env ]; then
    echo '[Laravel project has already been created...]'
    exit 0
fi

echo 'PROJECT_NAME='$1 > .env

docker-compose run --rm app composer create-project --prefer-dist laravel/laravel /var/www/$1 "5.7.*" && \
sed -e "s/{INPUT_APP_NAME}/$1/g" build/env-default > $1/.env && \
docker-compose run --rm app php artisan key:generate && \
docker-compose up -d --build
