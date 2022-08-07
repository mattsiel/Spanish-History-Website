/* eslint-disable linebreak-style */
/* eslint-disable import/extensions */
import Sequelize from 'sequelize';

import sequelize from '../../middleware/sequelize.js';
import FamilyModel from '../../models/family.model.js';

const Family = FamilyModel(sequelize, Sequelize);
const eraseDatabaseOnSync = true;

const createFamily = () => {
  Family.bulkCreate([
    {
      family_name: 'Bellonid',
      family_head: null,
      family_creator_id: null,
      family_start: '0800-01-01',
    },
    {
      family_name: 'Anscarid',
      family_head: null,
      family_creator_id: null,
      family_start: '0850-01-01',
    },
    {
      family_name: 'Robertian',
      family_head: null,
      family_creator_id: null,
      family_start: '0800-01-01',
    },
    {
      family_name: 'Salian',
      family_head: null,
      family_creator_id: null,
      family_start: '1000-01-01',
    },
    {
      family_name: 'Ottonian',
      family_head: null,
      family_creator_id: null,
      family_start: '0912-01-01',
    },
    { validate: false },
  ]);
};

const initFamily = async () => {
  sequelize.sync({ force: eraseDatabaseOnSync }).then(async () => {
    if (eraseDatabaseOnSync) {
      createFamily();
    }
  });
};

export default initFamily;
