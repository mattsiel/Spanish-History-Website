require('dotenv').config();

const express = require('express');
const bodyParser = require('body-parser');

const app = express();
const swaggerUI = require('swagger-ui-express');
const swaggerConf = require('./swagger-config');

const port = process.env.API_PORT;

// api routes
const dynastyRoute = require('./routes/dynasty');
const personRoute = require('./routes/person');
const familyRoute = require('./routes/family');

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

app.get('/person', personRoute.getPersons);
app.get('/person/:id', personRoute.getPersonById);
app.post('/person', personRoute.createPerson);
app.patch('/person/:id', personRoute.updatePerson);
app.delete('/person/:id', personRoute.deletePerson);
app.get('/family', familyRoute.getFamilys);
app.get('/family/:id', familyRoute.getFamilyById);
app.post('/family', familyRoute.createFamily);
app.patch('/family/:id', familyRoute.updateFamily);
app.delete('/family/:id', familyRoute.deleteFamily);
app.get('/dynasty', dynastyRoute.getDynastys);
app.get('/dynasty/:id', dynastyRoute.getDynastyById);
app.post('/dynasty', dynastyRoute.createDynasty);
app.patch('/dynasty/:id', dynastyRoute.updateDynasty);
app.delete('/dynasty/:id', dynastyRoute.deleteDynasty);

app.listen(port, () => {
  console.log(`App running on port ${port}. pg port access from ${process.env.PGPORT}`);
});

module.exports = app;
