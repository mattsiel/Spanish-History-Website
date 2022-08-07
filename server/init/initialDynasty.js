/* eslint-disable linebreak-style */
/* eslint-disable import/extensions */
import Sequelize from 'sequelize';

import sequelize from '../middleware/sequelize.js';
import DynastyModel from '../models/dynasty.model.js';

const Dynasty = DynastyModel(sequelize, Sequelize);
const eraseDatabaseOnSync = true;

const createDynasty = () => {
  Dynasty.bulkCreate([
    {
      dynasty_name: 'Bellonid',
      dynasty_head: null,
      dynasty_creator_id: null,
      dynasty_start: '0800-01-01',
    },
    {
      dynasty_name: 'Anscarid',
      dynasty_head: null,
      dynasty_creator_id: null,
      dynasty_start: '0850-01-01',
    },
    {
      dynasty_name: 'Robertian',
      dynasty_head: null,
      dynasty_creator_id: null,
      dynasty_start: '0800-01-01',
    },
    {
      dynasty_name: 'Salian',
      dynasty_head: null,
      dynasty_creator_id: null,
      dynasty_start: '1000-01-01',
    },
    {
      dynasty_name: 'Ottonian',
      dynasty_head: null,
      dynasty_creator_id: null,
      dynasty_start: '0912-01-01',
    },
  ]);
};

const initDynasty = async () => {
  sequelize.sync({ force: eraseDatabaseOnSync }).then(async () => {
    if (eraseDatabaseOnSync) {
      createDynasty();
    }
  });
};

export default initDynasty;
