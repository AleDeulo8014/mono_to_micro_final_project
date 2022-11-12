#! /bin/bash

docker image prune --all
docker-compose -f docker-compose-build.yaml build --parallel

# Create the .env file from env_vars defined in TravisCI
 echo -e "POSTGRES_DB = $POSTGRES_DB\nPOSTGRES_HOST = $POSTGRES_HOST\nPOSTGRES_USERNAME = $POSTGRES_USERNAME\nPOSTGRES_PASSWORD = $POSTGRES_PASSWORD\nDB_DIALECT = $DB_DIALECT\nAWS_REGION = $AWS_REGION\nAWS_PROFILE = $AWS_PROFILE\nAWS_BUCKET = $AWS_BUCKET\nJWT_SECRET = $JWT_SECRET\nURL = $URL" > ./.env

docker-compose up