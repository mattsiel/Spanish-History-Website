FROM node:latest
WORKDIR /app
COPY . .
RUN npm install
EXPOSE 3100
ENTRYPOINT ["node", "index.js"]