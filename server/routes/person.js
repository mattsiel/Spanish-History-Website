/* eslint-disable import/extensions */
import { Router } from 'express';
import Sequelize from 'sequelize';
import PersonModel from '../models/person.model.js';
import sequelize from '../middleware/sequelize.js';

const Person = PersonModel(sequelize, Sequelize);

const router = Router();

router.get('/', (req, res) => {
  Person.findAll().then((person) => res.json(person));
  return res.status(200);
});

router.get('/:id', (req, res) => {
  Person.findAll({ where: { id: req.params.id } }).then((persons) => res.json(persons));
  return res.status(200);
});

const { Op } = Sequelize;

router.get('/search', (req, res) => {
  Person.findAll({
    where: {
      name_first: {
        [Op.or]: [].concat(req.query.name_first),
      },
    },
  }).then((person) => res.json(person));
});

router.get('/forID', (req, res) => {
  Person.findAll({
    where: {
      name_first : req.query.name_first,
      name_last : req.query.name_last,
    },
  }).then((person) => res.send(person.id));
});

router.get('/searchDynasty', (req, res) => {
  Person.findAll({
    where: {
      dynasty_id : req.query.dynasty_id,
    },
  }).then((person) => res.send(person));
});

router.get('/searchFamily', (req, res) => {
  Person.findAll({
    where: {
      family_id : req.query.family_id,
    },
  }).then((person) => res.send(person));
});

router.post('/', async (req, res) => {
  Person.create(
    {
      name_first : req.body.name_first,
      name_by : req.body.name_by,
      name_middle : req.body.name_middle,
      name_maiden : req.body.name_maiden,
      name_last : req.body.name_last,
      gender : req.body.gender,
      date_birth : req.body.date_birth,
      date_death : req.body.date_death,
      place_birth : req.body.place_birth,
      place_death : req.body.place_death,
      cause_death : req.body.cause_death,
      family_id : req.body.family_id,
      person_source : req.body.person_source, 
      dynasty_id : req.body.dynasty_id,
    },
    { validate: true },
  ).then((person) => {
    res.json(person);
  }).catch((err) => {
    if (err.name === 'SequelizeValidationError') {
      res.status(401).send('The Data Types of the Data did not match the database');
    }
  });
});

router.patch('/:id', (req, res) => {
  Person.findByPk(req.params.id).then((person) => {
    person.update({
      name_first : req.body.name_first,
      name_by : req.body.name_by,
      name_middle : req.body.name_middle,
      name_maiden : req.body.name_maiden,
      name_last : req.body.name_last,
      gender : req.body.gender,
      date_birth : req.body.date_birth,
      date_death : req.body.date_death,
      place_birth : req.body.place_birth,
      place_death : req.body.place_death,
      cause_death : req.body.cause_death,
      family_id : req.body.family_id,
      person_source : req.body.person_source, 
      dynasty_id : req.body.dynasty_id,
    }).then((upPerson) => {
      res.json(upPerson);
    });
  });
});

router.delete('/:id', (req, res) => {
  Person.findByPk(req.params.id).then((person) => {
    person.destroy();
  }).then(() => {
    res.sendStatus(200);
  });
});

export default router;
