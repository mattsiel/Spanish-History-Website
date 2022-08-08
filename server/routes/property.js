/* eslint-disable import/extensions */
import { Router } from 'express';
import Sequelize from 'sequelize';
import PropertyModel from '../models/property.model.js';
import sequelize from '../middleware/sequelize.js';

const Property = PropertyModel(sequelize, Sequelize);

const router = Router();

router.get('/', (req, res) => {
  Property.findAll().then((property) => res.json(property));
  return res.status(200);
});

router.get('/:id', (req, res) => {
  Property.findAll({ where: { id: req.params.id } }).then((propertys) => res.json(propertys));
  return res.status(200);
});

const { Op } = Sequelize;

router.get('/search', (req, res) => {
  Property.findAll({
    where: {
      property_name: {
        [Op.or]: [].concat(req.query.property_name),
      },
    },
  }).then((property) => res.json(property));
});

router.get('/forID', (req, res) => {
  Property.findOne({
    where: {
      property_name: req.query.property_name,
    },
  }).then((property) => res.send(property.id));
});

router.get('/searchType', (req, res) => {
  Property.findAll({
    where: {
      property_type : req.query.property_type,
    },
  }).then((property) => res.send(property));
});

router.post('/', async (req, res) => {
  Property.create(
    {
      property_size : req.body.property_size,
      property_name : req.body.property_name,
      property_type : req.body.property_type,
      property_start : req.body.property_start,
      property_creator_id : req.body.property_creator_id,
    },
    { validate: true },
  ).then((property) => {
    res.json(property);
  }).catch((err) => {
    if (err.name === 'SequelizeValidationError') {
      res.status(401).send('The Data Types of the Data did not match the database');
    }
  });
});

router.patch('/:id', (req, res) => {
  Property.findByPk(req.params.id).then((property) => {
    property.update({
      property_size : req.body.property_size,
      property_name : req.body.property_name,
      property_type : req.body.property_type,
      property_start : req.body.property_start,
      property_creator_id : req.body.property_creator_id,
    }).then((upProperty) => {
      res.json(upProperty);
    });
  });
});

router.delete('/:id', (req, res) => {
  Property.findByPk(req.params.id).then((property) => {
    property.destroy();
  }).then(() => {
    res.sendStatus(200);
  });
});

export default router;
