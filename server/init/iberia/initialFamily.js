/* eslint-disable linebreak-style */
/* eslint-disable import/extensions */
import Sequelize from 'sequelize';

import sequelize from '../../middleware/sequelize.js';
import FamilyModel from '../../models/family.model.js';

const Family = FamilyModel(sequelize, Sequelize);

import { dynastyFind , familyFind } from '../../middleware/findID.js';


const createFamily = () => {
  Family.bulkCreate([
    {
      family_name : 'Barcelona',
      dynasty_id : dynastyFind('Bellonid'),
      family_head : null,
      family_creator_id : null,
      family_start : '0878-01-01',
      cadet_of : null,
    },
    {
      family_name : 'Cerdanya',
      dynasty_id : dynastyFind('Bellonid'),
      family_head : null,
      family_creator_id : null,
      family_start : '0878-01-01',
      cadet_of : familyFind('Barcelona'),
    },
    {
      family_name : 'Urgell',
      dynasty_id : dynastyFind('Bellonid'),
      family_head : null,
      family_creator_id : null,
      family_start : '0974-01-01',
      cadet_of : familyFind('Barcelona'),
    },
    {
      family_name : 'Forcalquier',
      dynasty_id : dynastyFind('Bellonid'),
      family_head : null,
      family_creator_id : null,
      family_start : '1094-01-01',
      cadet_of : familyFind('Urgell'),
    },
    { validate: false },
  ]);
};

const initFamily = async () => {
  sequelize.sync().then(async () => {
    createFamily();
  });
};

export default initFamily;
