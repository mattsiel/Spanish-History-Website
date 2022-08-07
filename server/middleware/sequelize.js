import Sequelize from 'sequelize';

console.log(process.env.PGDATABASE);
console.log(process.env.PGUSER);
console.log(process.env.PGPASSWORD);
const sequelize = new Sequelize(
  process.env.PGDATABASE,
  process.env.PGUSER,
  process.env.PGPASSWORD,
  {
    host: 'ibe-db',
    dialect: 'postgres',
    port: process.env.PGPORT,
  },
);

sequelize.authenticate().then(() => console.log('Connected to the database !'));

export default sequelize;
