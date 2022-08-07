
const getPropertyModel = (sequelize, { DataTypes }) => {
    const Property = sequelize.define('property', {
      property_size: {
        type: DataTypes.INTEGER,
        allowNull: true,
        validate: {
          isInt: true,
        },
      },
      property_name: {
        type: DataTypes.STRING(100),
        allowNull: false,
        validate: {
          notEmpty: true,
          notNull: true,
          isAlpha: true, 
        },
      },
      property_type: {
        type: DataTypes.STRING(100),
        allowNull: false,
        validate: {
          notEmpty: true,
          notNull: true,
          isAlpha: true, 
        },
      },
      property_creator_id: {
        type: DataTypes.INTEGER,
        allowNull: true,
        validate: {
          isDate: true,
        },
      },
      property_size: {
        type: DataTypes.INTEGER,
        allowNull: true,
        validate: {
          isInt: true,
        },
      },
  
    });
    return Property;
  };
  
  export default getPropertyModel;
  