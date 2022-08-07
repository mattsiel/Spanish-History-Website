import Sequelize from 'sequelize';


const sequelize = new Sequelize(
  "iber-db",
  "mattsii",
  "theonemat",
  {
    host: 'localhost',
    dialect: 'postgres',
    port: 4000,
  },
);

sequelize.authenticate().then(() => console.log('Connected to the database !'));

export default sequelize;
