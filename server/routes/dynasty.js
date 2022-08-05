/* eslint-disable import/extensions */
import { Router } from 'express';
import Sequelize from 'sequelize';
import DynastyModel from '../models/Dynasty.model.js';
import sequelize from '../middleware/sequelize.js';

const Dynasty = DynastyModel(sequelize, Sequelize);

const router = Router();

router.get('/', (req, res) => {
  Dynasty.findAll().then((dynasty) => res.json(dynasty));
  return res.status(200);
});

router.get('/:id', (req, res) => {
  Dynasty.findAll({ where: { id: req.params.id } }).then((dynastys) => res.json(dynastys));
  return res.status(200);
});

const { Op } = Sequelize;

router.get('/search', (req, res) => {
  Dynasty.findAll({
    where: {
      dynasty_name: {
        [Op.or]: [].concat(req.query.dynasty_name),
      },
    },
  }).then((dynasty) => res.json(dynasty));
});

router.get('/forID', (req, res) => {
  Dynasty.findAll({
    where: {
      dynasty_name: req.query.dynasty_name,
    }
  }).then((dynasty) => res.send(dynasty.id));
});

router.post('/', async (req, res) => {
  Dynasty.create({
    dynasty_name: req.body.dynasty_name,
    dynasty_head: req.body.dynasty_head,
    dynasty_creator_id: req.body.dynasty_creator_id,
    dynasty_start: req.body.dynasty_start,
  }).then((dynasty) => {
    res.json(dynasty);
  });
  return res;
});

router.patch('/:id', (req, res) => {
  Dynasty.findByPk(req.params.id).then((dynasty) => {
    dynasty.update({
      dynasty_name: req.body.dynasty_name,
      dynasty_head: req.body.dynasty_head,
      dynasty_creator_id: req.body.dynasty_creator_id,
      dynasty_start: req.body.dynasty_start,
    }).then((upDynasty) => {
      res.json(upDynasty);
    });
  });
});

router.delete('/:id', (req, res) => {
  Dynasty.findByPk(req.params.id).then((dynasty) => {
    dynasty.destroy();
  }).then(() => {
    res.sendStatus(200);
  });
});

export default router;
