import Sequelize from 'sequelize';

const sequelize = new Sequelize(
  process.env.PGDATABASE,
  process.env.PGUSER,
  process.env.PGPASSWORD,
  {
    host: 'localhost',
    dialect: 'postgres',
    port: process.env.PGPORT,
  },
);

sequelize.authenticate().then(() => console.log('Connected to the database !'));

export default sequelize;
