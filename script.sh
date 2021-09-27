#!/bin/bash

env > env.file.script
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
       RC_SQL_USERNAME_LOCAL: "$PROD_RC_SQL_USERNAME_LOCAL",
       RC_SQL_PASSWORD_LOCAL: "$PROD_RC_SQL_PASSWORD_LOCAL",
       RC_SQL_DATABASE_LOCAL: "$PROD_RC_SQL_DATABASE_LOCAL",
       RC_SQL_HOST_LOCAL: "$PROD_RC_SQL_HOST_LOCAL",
       POSTGRES_HOST: "$PROD_POSTGRES_HOST",
       POSTGRES_PASSWORD: "$PROD_POSTGRES_PASSWORD",
       POSTGRES_USER: "$PROD_POSTGRES_USER",
       #POSTGRES_PORT: "$PROD_POSTGRES_PORT",
       #POSTGRES_DATABASE: "$PROD_POSTGRES_DATABASE",
       LOGZIO_HOST: "$PROD_LOGZIO_HOST",
       LOGZIO_TOKEN: "$PROD_LOGZIO_TOKEN"
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
       RC_SQL_USERNAME_LOCAL: "$DEMO_RC_SQL_USERNAME_LOCAL",
       RC_SQL_PASSWORD_LOCAL: "$DEMO_RC_SQL_PASSWORD_LOCAL",
       RC_SQL_DATABASE_LOCAL: "$DEMO_RC_SQL_DATABASE_LOCAL",
       RC_SQL_HOST_LOCAL: "$DEMO_RC_SQL_HOST_LOCAL",
       POSTGRES_HOST: "$DEMO_POSTGRES_HOST",
       POSTGRES_PASSWORD: "$DEMO_POSTGRES_PASSWORD",
       POSTGRES_USER: "$DEMO_POSTGRES_USER",
       #POSTGRES_PORT: "$DEMO_POSTGRES_PORT",
       #POSTGRES_DATABASE: "$DEMO_POSTGRES_DATABASE",
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
       RC_SQL_USERNAME_LOCAL: "$STAGING_RC_SQL_USERNAME_LOCAL",
       RC_SQL_PASSWORD_LOCAL: "$STAGING_RC_SQL_PASSWORD_LOCAL",
       RC_SQL_DATABASE_LOCAL: "$STAGING_RC_SQL_DATABASE_LOCAL",
       RC_SQL_HOST_LOCAL: "$STAGING_RC_SQL_HOST_LOCAL",
       POSTGRES_HOST: "$STAGING_POSTGRES_HOST",
       POSTGRES_PASSWORD: "$STAGING_POSTGRES_PASSWORD",
       POSTGRES_USER: "$STAGING_POSTGRES_USER",
       #POSTGRES_PORT: "$STAGING_POSTGRES_PORT",
       #POSTGRES_DATABASE: "$STAGING_POSTGRES_DATABASE",
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
       RC_SQL_USERNAME_LOCAL: "$DEV_RC_SQL_USERNAME_LOCAL",
       RC_SQL_PASSWORD_LOCAL: "$DEV_RC_SQL_PASSWORD_LOCAL",
       RC_SQL_DATABASE_LOCAL: "$DEV_RC_SQL_DATABASE_LOCAL",
       RC_SQL_HOST_LOCAL: "$DEV_RC_SQL_HOST_LOCAL",
       POSTGRES_HOST: "$DEV_POSTGRES_HOST",
       POSTGRES_PASSWORD: "$DEV_POSTGRES_PASSWORD",
       POSTGRES_USER: "$DEV_POSTGRES_USER",
       POSTGRES_PORT: "$DEV_POSTGRES_PORT",
       POSTGRES_DATABASE: "$DEV_POSTGRES_DATABASE",
    },
  }]
}
EOF
echo "Creating prod ecosystem.config.js"

fi
