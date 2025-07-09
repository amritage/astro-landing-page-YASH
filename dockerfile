# Use the official Node.js 20 image
FROM node:20-alpine

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

RUN npm run build 

EXPOSE 4321
ENV PORT=4321

CMD npx astro preview --port $PORT --host 