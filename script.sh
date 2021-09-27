#!/bin/bash

BRANCH=$(echo $CODEBUILD_BADGE_URL | cut -d '=' -f 3)

echo "Check for branches"
if [[ $BRANCH == 'main' ]]
then

echo "Creating prod ecosystem.config.js"
cat > ecosystem.config.js <<-EOF
module.exports = {
  apps : [{
    name   : "app",
    script : "dist/app.js",
    env_prod: {
       RC_SQL_USERNAME_LOCAL: "$RC_SQL_USERNAME_LOCAL",
       RC_SQL_PASSWORD_LOCAL: "$RC_SQL_PASSWORD_LOCAL",
       RC_SQL_DATABASE_LOCAL: "$RC_SQL_DATABASE_LOCAL",
       RC_SQL_HOST_LOCAL: "$RC_SQL_HOST_LOCAL",
       POSTGRES_HOST: "$POSTGRES_HOST",
       POSTGRES_PASSWORD: "$POSTGRES_PASSWORD",
       POSTGRES_USER: "$POSTGRES_USER",
       #POSTGRES_PORT: "$POSTGRES_PORT",
       #POSTGRES_DATABASE: "$POSTGRES_DATABASE",
       LOGZIO_HOST: "$LOGZIO_HOST",
       LOGZIO_TOKEN: "$LOGZIO_TOKEN"
    },
  }]
}
EOF
echo "Done successfully"

elif [[ $BRANCH == 'demo' ]]
then

echo "Creating demo ecosystem.config.js"
cat > ecosystem.config.js <<-EOF
module.exports = {
  apps : [{
    name   : "app",
    script : "dist/app.js",
    env_demo: {
       RC_SQL_USERNAME_LOCAL: "$RC_SQL_USERNAME_LOCAL",
       RC_SQL_PASSWORD_LOCAL: "$RC_SQL_PASSWORD_LOCAL",
       RC_SQL_DATABASE_LOCAL: "$RC_SQL_DATABASE_LOCAL",
       RC_SQL_HOST_LOCAL: "$RC_SQL_HOST_LOCAL",
       POSTGRES_HOST: "$POSTGRES_HOST",
       POSTGRES_PASSWORD: "$POSTGRES_PASSWORD",
       POSTGRES_USER: "$POSTGRES_USER",
       #POSTGRES_PORT: "$POSTGRES_PORT",
       #POSTGRES_DATABASE: "$POSTGRES_DATABASE",
    },
  }]
}
EOF
echo "Done successfully"

elif [[ $BRANCH == 'staging' ]]
then

echo "Creating staging ecosystem.config.js"
cat > ecosystem.config.js <<-EOF
module.exports = {
  apps : [{
    name   : "app",
    script : "dist/app.js",
    env_staging: {
       RC_SQL_USERNAME_LOCAL: "$RC_SQL_USERNAME_LOCAL",
       RC_SQL_PASSWORD_LOCAL: "$RC_SQL_PASSWORD_LOCAL",
       RC_SQL_DATABASE_LOCAL: "$RC_SQL_DATABASE_LOCAL",
       RC_SQL_HOST_LOCAL: "$RC_SQL_HOST_LOCAL",
       POSTGRES_HOST: "$POSTGRES_HOST",
       POSTGRES_PASSWORD: "$POSTGRES_PASSWORD",
       POSTGRES_USER: "$POSTGRES_USER",
       #POSTGRES_PORT: "$POSTGRES_PORT",
       #POSTGRES_DATABASE: "$POSTGRES_DATABASE",
    },
  }]
}
EOF
echo "Done successfully"

elif [[ $BRANCH == 'develop' ]]
then

echo "Creating develop ecosystem.config.js"
cat > ecosystem.config.js <<-EOF
module.exports = {
  apps : [{
    name   : "app",
    script : "dist/app.js",
    env_dev: {
       RC_SQL_USERNAME_LOCAL: "$RC_SQL_USERNAME_LOCAL",
       RC_SQL_PASSWORD_LOCAL: "$RC_SQL_PASSWORD_LOCAL",
       RC_SQL_DATABASE_LOCAL: "$RC_SQL_DATABASE_LOCAL",
       RC_SQL_HOST_LOCAL: "$RC_SQL_HOST_LOCAL",
       POSTGRES_HOST: "$POSTGRES_HOST",
       POSTGRES_PASSWORD: "$POSTGRES_PASSWORD",
       POSTGRES_USER: "$POSTGRES_USER",
       POSTGRES_PORT: "$POSTGRES_PORT",
       POSTGRES_DATABASE: "$POSTGRES_DATABASE",
    },
  }]
}
EOF
echo "Creating prod ecosystem.config.js"

fi
