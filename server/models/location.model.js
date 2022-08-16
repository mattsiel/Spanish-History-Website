
const getLocationModel = (sequelize, { DataTypes }) => {
    const Location = sequelize.define('location', {
      location_name: {
        type: DataTypes.STRING(100),
        allowNull: false,
        validate: {
          notEmpty: true,
          notNull: true,
          isAlpha: true, 
        },
      },
      location_alt_names: {
        type: DataTypes.STRING(100),
        allowNull: true,
        validate: {
          isAlpha: true, 
        },
      },
      location_north: {
        type: DataTypes.DECIMAL(10,2),
        allowNull: false,
        validate: {
          notEmpty: true,
          notNull: true,
        },
      },
      location_east: {
        type: DataTypes.DECIMAL(10,2),
        allowNull: false,
        validate: {
          notEmpty: true,
          notNull: true,
        },
      },
      population: {
        type: DataTypes.INTEGER,
        allowNull: true,
      },
      location_info: {
        type: DataTypes.TEXT,
        allowNull: true,
      },
      location_sources: {
        type: DataTypes.TEXT,
        allowNull: true,
      },
  
    });
    return Location;
  };
  
  export default getLocationModel;
  