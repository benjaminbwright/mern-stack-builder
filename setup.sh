#!/bin/bash

# remove .git folder
rm -rf .git

# install database and orm/odm setup
if [[ $1 = "mongoose" ]] || [[ $1 = "mongo" ]] || [[ $1 = "mongodb" ]]
then
  cp -a templates/mongoose/. ./
elif [[ $1 = "mysql" ]] || [[ $1 = "sequelize" ]]
then
  cp -a templates/sequelize/. ./
fi

rm -rf templates

# install react app
echo "installing react app"
npx create-react-app client

# add proxy too the client-side package.json
echo "adding proxy to client/package.json"
sed -i '' '/name/a \
\  "proxy": "http://localhost:4000", \
' client/package.json 

# install the node_modules
echo "installing server dependencies"
yarn install

# destroy setup file
rm setup.sh

# start up the app
yarn start