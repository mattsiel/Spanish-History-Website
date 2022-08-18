/* eslint-disable import/extensions */
import { Router } from 'express';
import Sequelize from 'sequelize';
import FamilyModel from '../models/family.model.js';
import sequelize from '../middleware/sequelize.js';

const Family = FamilyModel(sequelize, Sequelize);

const router = Router();

router.get('/', (req, res) => {
  Family.findAll().then((family) => res.json(family));
  return res.status(200);
});

router.get('/:id', (req, res) => {
  Family.findAll({ where: { id: req.params.id } }).then((familys) => res.json(familys));
  return res.status(200);
});

const { Op } = Sequelize;

router.get('/search', (req, res) => {
  Family.findAll({
    where: {
      family_name: {
        [Op.or]: [].concat(req.query.family_name),
      },
    },
  }).then((family) => res.json(family));
});

router.get('/forID', (req, res) => {
  Family.findAll({
    where: {
      family_name: req.query.family_name,
    },
  }).then((family) => res.send(family.id));
});

router.post('/', async (req, res) => {
  Family.create(
    { 
      family_name : req.body.family_name,
      family_culture : req.body.family_cuture,
      dynasty_id : req.body.dynasty_id,
      family_head : req.body.family_head,
      family_creator_id : req.body.family_creator_id,
      family_start : req.body.family_start,
      cadet_of : req.body.cadet_of,
    },
    { validate: true },
  ).then((family) => {
    res.json(family);
  }).catch((err) => {
    if (err.name === 'SequelizeValidationError') {
      res.status(401).send('The Data Types of the Data did not match the database');
    }
  });
});

router.patch('/:id', (req, res) => {
  Family.findByPk(req.params.id).then((family) => {
    family.update({
      family_name : req.body.family_name,
      family_culture : req.body.family_culture,
      dynasty_id : req.body.dynasty_id,
      family_head : req.body.family_head,
      family_creator_id : req.body.family_creator_id,
      family_start : req.body.family_start,
      cadet_of : req.body.cadet_of,
    }).then((upFamily) => {
      res.json(upFamily);
    });
  });
});

router.delete('/:id', (req, res) => {
  Family.findByPk(req.params.id).then((family) => {
    family.destroy();
  }).then(() => {
    res.sendStatus(200);
  });
});

export default router;
