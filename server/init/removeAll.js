import sequelize from '../middleware/sequelize.js';

import FamilyModel from '../../models/family.model.js';
import DynastyModel from '../models/dynasty.model.js';

const Family = FamilyModel(sequelize, Sequelize);
const Dynasty = DynastyModel(sequelize, Sequelize);

const removeAll = async () => {
    await Family.destroy({
        where: { id:18},
        truncate: true
    })

    await Dynasty.destroy({
        where: {},
        truncate: true
    })
};

const initRemove = async () => {
    await sequelize.sync({ force: true }).then(async () => {
      removeAll();
    });
  };
  
  export default initRemove;
