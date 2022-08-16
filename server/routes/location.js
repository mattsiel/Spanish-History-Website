/* eslint-disable import/extensions */
import { Router } from 'express';
import Sequelize from 'sequelize';
import LocationModel from '../models/location.model.js';
import sequelize from '../middleware/sequelize.js';

const Location = LocationModel(sequelize, Sequelize);

const router = Router();

router.get('/', (req, res) => {
  Location.findAll().then((location) => res.json(location));
  return res.status(200);
});

router.get('/:id', (req, res) => {
  Location.findAll({ where: { id: req.params.id } }).then((locations) => res.json(locations));
  return res.status(200);
});

const { Op } = Sequelize;

router.get('/search', (req, res) => {
  Location.findAll({
    where: {
      location_name: {
        [Op.or]: [].concat(req.query.location_name),
      },
    },
  }).then((location) => res.json(location));
});

router.get('/forID', (req, res) => {
  Location.findAll({
    where: {
      location_name: req.query.location_name,
    },
  }).then((location) => res.send(location.id));
});

router.post('/', async (req, res) => {
  Location.create(
    {
        location_name: req.body.location_name,
        location_alt_names: req.body.location_alt_names, 
        location_north: req.body.location_north,
        location_east: req.body.location_east,
        population: req.body.population,
        location_info: req.body.location_info,
        location_sources: req.body.location_sources,
    },
    { validate: true },
  ).then((location) => {
    res.json(location);
  }).catch((err) => {
    if (err.name === 'SequelizeValidationError') {
      res.status(401).send('The Data Types of the Data did not match the database');
    }
  });
});

router.patch('/:id', (req, res) => {
  Location.findByPk(req.params.id).then((location) => {
    location.update({
        location_name: req.body.location_name,
        location_alt_names: req.body.location_alt_names, 
        location_north: req.body.location_north,
        location_east: req.body.location_east,
        population: req.body.population,
        location_info: req.body.location_info,
        location_sources: req.body.location_sources,
    }).then((upLocation) => {
      res.json(upLocation);
    });
  });
});

router.delete('/:id', (req, res) => {
  Location.findByPk(req.params.id).then((location) => {
    location.destroy();
  }).then(() => {
    res.sendStatus(200);
  });
});

export default router;
