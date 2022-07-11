/* eslint-disable import/no-extraneous-dependencies */
require('dotenv').config();

const express = require('express');
const bodyParser = require('body-parser');

const app = express();
const swaggerUI = require('swagger-ui-express');
const swaggerConf = require('./swagger-config');

const port = process.env.API_PORT;

// api routes
const indexRouterV1 = require('./routes/v1/index');
const indexRouterV2 = require('./routes/v2/index');

app.use(bodyParser.json());
app.use(
  bodyParser.urlencoded({
    extended: true,
  }),
);

app.use(
  '/api-docs',
  swaggerUI.serve,
  swaggerUI.setup(swaggerConf.specs, swaggerConf.uiOptions),
);

app.get('/', (request, response) => {
  response.json({ info: `the vars are ${process.env.PGHOST}` });
});

app.use('/v1', indexRouterV1);

app.listen(port, () => {
  console.log(`App running on port ${port}. pg port access from ${process.env.PGPORT}`);
});

module.exports = app;
