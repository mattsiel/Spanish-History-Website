const express = require('express');
const bodyParser = require('body-parser');
const app = express();
const swaggerUI = require("swagger-ui-express");
const swaggerConf = require("./swagger-config");
const port = 3000;

// api routes
const personRouteV1 = require("./person.js");

app.use(bodyParser.json());
app.use(
  bodyParser.urlencoded({
    extended: true,
  })
);

app.use(
  "/api-docs",
  swaggerUI.serve,
  swaggerUI.setup(swaggerConf.specs, swaggerConf.uiOptions)
);

app.get('/', (request, response) => {
  response.json({ info: 'Node.js, Express, and Postgres API' })
});

function useV1(req, res, next) {
  app.get('/users', personRouteV1);
}

app.listen(port, () => {
  console.log(`App running on port ${port}.`)
});

app.use(
  "/api/v1", useV1
);


module.exports = app;
