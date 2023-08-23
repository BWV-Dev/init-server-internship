#!/bin/bash

GITHUB_TOKEN=${github_token}
GIT_URL=${git_url}
ENV=${env}
MYSQL_USER=${user_name}
MYSQL_PASSWORD=${password}
DB_SCHEMA=${db_schema}
sudo git clone https://username:$GITHUB_TOKEN@$GIT_URL /source

git config --global --add safe.directory /source

cd /source
sudo git checkout develop
sudo git pull origin develop

if [ "$ENV" = "node" ]; then
    # create env development
    sudo mkdir env
    sudo touch env/development.env
    # create variable
    echo "NODE_ENV=development" >> env/development.env
    echo "PORT=3000" >> env/development.env
    echo "TYPEORM_HOST=host.docker.internal" >> env/development.env
    echo "TYPEORM_PORT=3306" >> env/development.env
    echo "TYPEORM_USERNAME=$MYSQL_USER" >> env/development.env
    echo "TYPEORM_PASSWORD=$MYSQL_PASSWORD" >> env/development.env
    echo "TYPEORM_DATABASE=$DB_SCHEMA" >> env/development.env
else 
    sudo cp .env.example .env
fi

sudo docker-compose down -d
sudo docker-compose up -d --build
