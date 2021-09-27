#!/bin/bash

cat > destfile <<-EOF
module.exports = {
  apps : [{
    name   : "app",
    script : "dist/app.js",
    env_prod: {
       RC_SQL_USERNAME_LOCALRODUCTION: "this.$RC_SQL_USERNAME_LOCALRODUCTION"
    },
  }]
}
EOF
