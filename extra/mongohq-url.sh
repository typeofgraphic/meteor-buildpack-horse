#!/bin/sh
# Add an alias of MONGOHQ_URL to MONGO_URL.
echo "-----> Adding MONGO_URL env"
cat > "$APP_CHECKOUT_DIR"/.profile.d/mongo.sh <<EOF
  #!/bin/sh
  export MONGO_URL=\${MONGO_URL:-`ruby -e "require 'json'; puts JSON.parse(ENV['VCAP_SERVICES']).find { |key,value| key.include? 'mongodb' }[1][0]['credentials']['url']"`}}
EOF

