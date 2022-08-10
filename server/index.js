/* eslint-disable import/extensions */
import express from 'express';
import 'dotenv/config';
import cors from 'cors';
import bodyParser from 'body-parser';

// swagger init
import swaggerUI from 'swagger-ui-express';
import swaggerConf from './swagger-config.js';

// routes
import DynastyRoute from './routes/dynasty.js';
import PersonRoute from './routes/person.js';
import FamilyRoute from './routes/family.js';

// inits
import initDynasty from './init/initialDynasty.js';
import initIberianFamilies from './init/iberia/initialFamily.js';
import initRemove from './init/iberia/removeAll.js';

const app = express();

const port = process.env.API_PORT;

const corsOptions = {
  origin: 'http://localhost:3002',
};

app.use(cors(corsOptions));
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

app.use('/person', PersonRoute);
app.use('/family', FamilyRoute);
app.use('/dynasty', DynastyRoute);
initRemove();
initDynasty();
initIberianFamilies();

app.listen(port, () => {
  console.log(`App running on port ${port}. pg port access from ${process.env.PGPORT}`);
});

export default app;
