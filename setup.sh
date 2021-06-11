#!/bin/bash

# remove .git folder
rm -rf .git

# initialize git
git init

# install the node_modules
echo "installing server dependencies"
yarn install

# install database and orm/odm setup
if [[ $1 = "mongoose" ]] || [[ $1 = "mongo" ]] || [[ $1 = "mongodb" ]]
then
  cp -a templates/mongoose/. ./
  yarn add mongoose
elif [[ $1 = "mysql" ]] || [[ $1 = "sequelize" ]]
then
  cp -a templates/sequelize/. ./
  yarn add sequelize mysql2
fi

# remove database templates
rm -rf templates

# install react app
echo "installing react app"
npx create-react-app client

# add proxy too the client-side package.json
echo "adding proxy to client/package.json"
sed -i '' '/name/a \
\  "proxy": "http://localhost:4000", \
' client/package.json 

# destroy setup file
rm setup.sh

# start up the app
yarn start