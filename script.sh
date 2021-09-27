#!/bin/bash

env > env.file
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
       POSTGRES_PORT: "$POSTGRES_PORT",
       POSTGRES_DATABASE: "$POSTGRES_DATABASE",
       LOGZIO_HOST: "$LOGZIO_HOST",
       LOGZIO_TOKEN: "$LOGZIO_TOKEN"
    },
  }]
}
EOF
