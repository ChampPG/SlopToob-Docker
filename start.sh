#!/bin/bash

cd /SlopToob/

npm install
npx prisma generate
npx prisma migrate dev
npm run build
npm start