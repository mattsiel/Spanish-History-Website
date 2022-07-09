require('dotenv').config();

const express = require('express');
const bodyParser = require('body-parser');
const app = express();
const swaggerUI = require("swagger-ui-express");
const swaggerConf = require("./swagger-config");
const port = $API_PORT;

// api routes
const personRouteV1 = require("./routes/person.js");
const familyRouteV1 = require("./routes/family.js");

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

app.get('/person', personRouteV1.getPersons);
app.get('/person/:id', personRouteV1.getPersonById);
app.post('/person', personRouteV1.createPerson);
app.put('/person/:id', personRouteV1.updatePerson);
app.delete('/person/:id', personRouteV1.deletePerson);

app.get('/family', familyRouteV1.getFamilys);
app.get('/family/:id', familyRouteV1.getFamilyById);
app.post('/family', familyRouteV1.createFamily);
app.put('/family/:id', familyRouteV1.updateFamily);
app.delete('/family/:id', familyRouteV1.deleteFamily);

app.listen(port, () => {
  console.log(`App running on port ${port}.`)
});


module.exports = app;
