/* eslint-disable import/extensions */
import { Router } from 'express';
import Sequelize from 'sequelize';
import TitleModel from '../models/Title.model.js';
import sequelize from '../middleware/sequelize.js';

const Title = TitleModel(sequelize, Sequelize);

const router = Router();

router.get('/', (req, res) => {
  Title.findAll().then((title) => res.json(title));
  return res.status(200);
});

router.get('/:id', (req, res) => {
  Title.findAll({ where: { id: req.params.id } }).then((titles) => res.json(titles));
  return res.status(200);
});

const { Op } = Sequelize;

router.get('/search', (req, res) => {
  Title.findAll({
    where: {
      title_name: {
        [Op.or]: [].concat(req.query.title_name),
      },
    },
  }).then((title) => res.json(title));
});

router.get('/forID', (req, res) => {
  Title.findAll({
    where: {
      title_name: req.query.title_name,
    },
  }).then((title) => res.send(title.id));
});

router.post('/', async (req, res) => {
  Title.create(
    {
      title_name: req.body.title_name,
      title_head: req.body.title_head,
      title_creator_id: req.body.title_creator_id,
      title_start: req.body.title_start,
    },
    { validate: true },
  ).then((title) => {
    res.json(title);
  }).catch((err) => {
    if (err.name === 'SequelizeValidationError') {
      res.status(401).send('The Data Types of the Data did not match the database');
    }
  });
});

router.patch('/:id', (req, res) => {
  Title.findByPk(req.params.id).then((title) => {
    title.update({
      title_name: req.body.title_name,
      title_head: req.body.title_head,
      title_creator_id: req.body.title_creator_id,
      title_start: req.body.title_start,
    }).then((upTitle) => {
      res.json(upTitle);
    });
  });
});

router.delete('/:id', (req, res) => {
  Title.findByPk(req.params.id).then((title) => {
    title.destroy();
  }).then(() => {
    res.sendStatus(200);
  });
});

export default router;
