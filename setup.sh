#!/bin/bash

echo "installing react app"
npx create-react-app client

echo "adding proxy to client/package.json"
sed -i '' '/name/a \
\  "proxy": "http://localhost:4000", \
' client/package.json 