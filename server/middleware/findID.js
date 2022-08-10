import Sequelize from 'sequelize';

import sequelize from './sequelize.js';
import FamilyModel from '../models/family.model.js';
import DynastyModel from '../models/dynasty.model.js';

const Dynasty = DynastyModel(sequelize, Sequelize);
const Family = FamilyModel(sequelize, Sequelize);


const dynastyFind = async (dynastyName) => {

  const findDynasty = await Dynasty.findOne({
    where: {
      dynasty_name: dynastyName,
    }
  });
  return findDynasty.id;
};

const familyFind = async (familyName) =>{
  const findFamily = await Family.findOne({
    where: {
      family_name: familyName,
    }
  });
  return findFamily.id;
};

export { dynastyFind , familyFind };