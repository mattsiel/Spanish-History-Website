import Sequelize from 'sequelize';

import sequelize from '../../middleware/sequelize.js';
import FamilyModel from '../../models/family.model.js';
import DynastyModel from '../models/dynasty.model.js';

const Dynasty = DynastyModel(sequelize, Sequelize);
const Family = FamilyModel(sequelize, Sequelize);


const dynastyFind = (dynastyName) => (Dynasty.findOne({
  where: {
    dynasty_name: dynastyName,
  }
})).id;

const familyFind = (familyName) => (Family.findOne({
  where: {
    family_name: req.query.family_name,
  }
})).id;

export { dynastyFind , familyFind };