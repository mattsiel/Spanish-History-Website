import Sequelize from 'sequelize';

console.log(process.env.PGDATABASE);
console.log(process.env.PGUSER);
console.log(process.env.PGPASSWORD);
const sequelize = new Sequelize(
  process.env.PGDATABASE,
  process.env.PGUSER,
  process.env.PGPASSWORD,
  {
    host: '127.0.0.1',
    dialect: 'postgres',
    port: process.env.PGPORT,
  },
);

sequelize.authenticate().then(() => console.log('Connected to the database !'));

export default sequelize;
