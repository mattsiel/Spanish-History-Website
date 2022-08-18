FROM node:18-alpine
WORKDIR /app
COPY . .
RUN npm install
EXPOSE 3100
ENTRYPOINT ["node", "index.js"]