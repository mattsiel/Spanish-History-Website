/* eslint-disable import/extensions */
import { Router } from 'express';
import Sequelize from 'sequelize';
import RelationshipModel from '../models/relationship.model.js';
import sequelize from '../middleware/sequelize.js';

const Relationship = RelationshipModel(sequelize, Sequelize);

const router = Router();

router.get('/', (req, res) => {
  Relationship.findAll().then((relationship) => res.json(relationship));
  return res.status(200);
});

router.get('/:id', (req, res) => {
  Relationship.findAll({ where: { id: req.params.id } }).then((relationships) => res.json(relationships));
  return res.status(200);
});

const { Op } = Sequelize;

router.get('/searchPeople', (req, res) => {
  Relationship.findAll({
    where: {
      relationship_name: {
        [Op.or]: [].concat(req.query.person_1, req.query.person_2),
      },
    },
  }).then((relationship) => res.json(relationship));
});

router.get('/forID', (req, res) => {
  Relationship.findAll({
    where: {
      relationship_type : req.query.relationship_type,
    },
  }).then((relationship) => res.send(relationship.id));
});

router.post('/', async (req, res) => {
  Relationship.create(
    {
      relationship_type : req.body.relationship_type,
      relationship_start : req.body.relationship_start,
      relationship_end : req.body.relationship_end,
      person_1 : req.body.person_1,
      person_2 : req.body.person_2,
      person_1_role : req.body.person_1_role,
      person_2_role : req.body.person_2_role,
      relationship_notes : req.body.relationship_notes,
      relationship_source : req.body.relationship_start,
    },
    { validate: true },
  ).then((relationship) => {
    res.json(relationship);
  }).catch((err) => {
    if (err.name === 'SequelizeValidationError') {
      res.status(401).send('The Data Types of the Data did not match the database');
    }
  });
});

router.patch('/:id', (req, res) => {
  Relationship.findByPk(req.params.id).then((relationship) => {
    relationship.update({
      relationship_type : req.body.relationship_type,
      relationship_start : req.body.relationship_start,
      relationship_end : req.body.relationship_end,
      person_1 : req.body.person_1,
      person_2 : req.body.person_2,
      person_1_role : req.body.person_1_role,
      person_2_role : req.body.person_2_role,
      relationship_notes : req.body.relationship_notes,
      relationship_source : req.body.relationship_start,
    }).then((upRelationship) => {
      res.json(upRelationship);
    });
  });
});

router.delete('/:id', (req, res) => {
  Relationship.findByPk(req.params.id).then((relationship) => {
    relationship.destroy();
  }).then(() => {
    res.sendStatus(200);
  });
});

export default router;
