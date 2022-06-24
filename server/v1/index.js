require('dotenv').config();

const express = require('express');
const bodyParser = require('body-parser');
const app = express();
const swaggerUI = require("swagger-ui-express");
const swaggerConf = require("./swagger-config");
const port = 3100;

// api routes
const personRouteV1 = require("./routes/person.js");

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
  response.json({ info: `the vars are ${process.env.PGHOST}` });
});

app.get('/users', personRouteV1.getUsers);
app.get('/users/:id', personRouteV1.getUserById);
app.post('/users', personRouteV1.createUser);
app.put('/users/:id', personRouteV1.updateUser);
app.delete('/users/:id', personRouteV1.deleteUser);

app.listen(port, () => {
  console.log(`App running on port ${port}.`)
});


module.exports = app;
