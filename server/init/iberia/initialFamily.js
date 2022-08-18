/* eslint-disable linebreak-style */
/* eslint-disable import/extensions */
import Sequelize from 'sequelize';

import sequelize from '../../middleware/sequelize.js';
import FamilyModel from '../../models/family.model.js';

const Family = FamilyModel(sequelize, Sequelize);

import { dynastyFind , familyFind } from '../../middleware/findID.js';


const createFamily = async () => {

  // First Generation Houses 
  await Family.bulkCreate([
    {
      family_name : 'Barcelona',
      family_culture : 'Catalan',
      dynasty_id : await dynastyFind('Bellonid'),
      family_head : null,
      family_creator_id : null,
      family_start : '0878-01-01',
      cadet_of : null,
    },
    {
      family_name : 'Ivrea',
      family_culture : 'Castilian',
      dynasty_id : await dynastyFind('Anscarid'),
      family_head : null,
      family_creator_id : null,
      family_start : '0878-01-01',
      cadet_of : null,
    },
  ])

  // Second Generation Houses
  await Family.bulkCreate([
    {
      family_name : 'Cerdanya',
      family_culture : 'Catalan',
      dynasty_id : await dynastyFind('Bellonid'),
      family_head : null,
      family_creator_id : null,
      family_start : '0878-01-01',
      cadet_of : await familyFind('Barcelona'),
    },
    {
      family_name : 'Urgell',
      family_culture : 'Catalan',
      dynasty_id : await dynastyFind('Bellonid'),
      family_head : null,
      family_creator_id : null,
      family_start : '0974-01-01',
      cadet_of : await familyFind('Barcelona'),
    },
  ])

  // Third Generation Houses
  await Family.bulkCreate([
    {
      family_name : 'Forcalquier',
      family_culture : 'Catalan',
      dynasty_id : await dynastyFind('Bellonid'),
      family_head : null,
      family_creator_id : null,
      family_start : '1094-01-01',
      cadet_of : await familyFind('Urgell'),
    },
  ]);
};

const initFamily = async () => {
  sequelize.sync().then(async () => {
    createFamily();
  });
};

export default initFamily;
