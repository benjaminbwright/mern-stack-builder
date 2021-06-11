#!/bin/bash

# install database
if [[ $1 = "mongoose" ]]
  cp -a templates/mongoose/. ./
fi 

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

# remove .git folder
rm -rf .git

# destroy setup file
rm setup.sh

# start up the app
yarn start