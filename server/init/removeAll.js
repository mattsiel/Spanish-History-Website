import sequelize from '../middleware/sequelize.js';

const eraseDatabaseOnSync = true;

export const Delete = () => sequelize.sync({ force: eraseDatabaseOnSync }).then(async () => {
    return console.log('data is deleted');
});
