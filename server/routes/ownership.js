/* eslint-disable import/extensions */
import { Router } from 'express';
import Sequelize from 'sequelize';
import OwnershipModel from '../models/ownership.model.js';
import sequelize from '../middleware/sequelize.js';

const Ownership = OwnershipModel(sequelize, Sequelize);

const router = Router();

router.get('/', (req, res) => {
  Ownership.findAll().then((ownership) => res.json(ownership));
  return res.status(200);
});

router.get('/:id', (req, res) => {
  Ownership.findAll({ where: { id: req.params.id } }).then((ownerships) => res.json(ownerships));
  return res.status(200);
});

const { Op } = Sequelize;

router.get('/search', (req, res) => {
  Ownership.findAll({
    where: {
      ownership_name: {
        [Op.or]: [].concat(req.query.ownership_name),
      },
    },
  }).then((ownership) => res.json(ownership));
});

router.get('/forID', (req, res) => {
  Ownership.findAll({
    where: {
      ownership_name: req.query.ownership_name,
    },
  }).then((ownership) => res.send(ownership.id));
});

router.post('/', async (req, res) => {
  Ownership.create(
    {
      property_id : req.body.property_id,
      person_id : req.body.person_id,
      ownership_start : req.body.ownership_start,
      ownership_end : req.body.ownership_end,
      ownership_source : req.body.ownership_source,
    },
    { validate: true },
  ).then((ownership) => {
    res.json(ownership);
  }).catch((err) => {
    if (err.name === 'SequelizeValidationError') {
      res.status(401).send('The Data Types of the Data did not match the database');
    }
  });
});

router.patch('/:id', (req, res) => {
  Ownership.findByPk(req.params.id).then((ownership) => {
    ownership.update({
      property_id : req.body.property_id,
      person_id : req.body.person_id,
      ownership_start : req.body.ownership_start,
      ownership_end : req.body.ownership_end,
      ownership_source : req.body.ownership_source,
    }).then((upOwnership) => {
      res.json(upOwnership);
    });
  });
});

router.delete('/:id', (req, res) => {
  Ownership.findByPk(req.params.id).then((ownership) => {
    ownership.destroy();
  }).then(() => {
    res.sendStatus(200);
  });
});

export default router;
