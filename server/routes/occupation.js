/* eslint-disable import/extensions */
import { Router } from 'express';
import Sequelize from 'sequelize';
import OccupationModel from '../models/occupation.model.js';
import sequelize from '../middleware/sequelize.js';

const Occupation = OccupationModel(sequelize, Sequelize);

const router = Router();

router.get('/', (req, res) => {
  Occupation.findAll().then((occupation) => res.json(occupation));
  return res.status(200);
});

router.get('/:id', (req, res) => {
  Occupation.findAll({ where: { id: req.params.id } }).then((occupations) => res.json(occupations));
  return res.status(200);
});

const { Op } = Sequelize;

router.get('/search', (req, res) => {
  Occupation.findAll({
    where: {
      occupation_name: {
        [Op.or]: [].concat(req.query.occupation_name),
      },
    },
  }).then((occupation) => res.json(occupation));
});

router.get('/forID', (req, res) => {
  Occupation.findAll({
    where: {
      occupation_name: req.query.occupation_name,
    },
  }).then((occupation) => res.send(occupation.id));
});

router.post('/', async (req, res) => {
  Occupation.create(
    {
      occupation_type : req.body.occupation_type,
      occupation_start : req.body.occupation_start,
      occupation_end : req.body.occupation_end,
      occupation_info : req.body.occupation_info,
      person_id  : req.body.person_id,
    },
    { validate: true },
  ).then((occupation) => {
    res.json(occupation);
  }).catch((err) => {
    if (err.name === 'SequelizeValidationError') {
      res.status(401).send('The Data Types of the Data did not match the database');
    }
  });
});

router.patch('/:id', (req, res) => {
  Occupation.findByPk(req.params.id).then((occupation) => {
    occupation.update({
      occupation_type : req.body.occupation_type,
      occupation_start : req.body.occupation_start,
      occupation_end : req.body.occupation_end,
      occupation_info : req.body.occupation_info,
      person_id  : req.body.person_id,
    }).then((upOccupation) => {
      res.json(upOccupation);
    });
  });
});

router.delete('/:id', (req, res) => {
  Occupation.findByPk(req.params.id).then((occupation) => {
    occupation.destroy();
  }).then(() => {
    res.sendStatus(200);
  });
});

export default router;
