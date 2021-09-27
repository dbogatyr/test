#!/bin/bash


cat > destfile <<-EOF
module.exports = {
  apps : [{
    name   : "app",
    script : "dist/app.js",
    env_prod: {
       RC_SQL_USERNAME_LOCAL: "this.$RC_SQL_USERNAME_LOCAL"
    },
  }]
}
EOF
echo "export this.$RC_SQL_USERNAME_LOCAL" >> destfile
