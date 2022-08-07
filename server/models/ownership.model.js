

const getOwnershipModel = (sequelize, { DataTypes }) => {
    const Ownership = sequelize.define('ownership', {
      property_id: {
        type: DataTypes.INTEGER,
        allowNull: false,
        validate: {
          notEmpty: true,
          notNull: true,
          isInt: true, 
        },
      },
      person_id: {
        type: DataTypes.INTEGER,
        allowNull: false,
        validate: {
          notEmpty: true,
          notNull: true,
          isInt: true, 
        },
      },
      ownership_start: {
        type: DataTypes.DATEONLY,
        allowNull: true,
        validate: {
          isDate: true,
        },
      },
      ownership_start: {
        type: DataTypes.DATEONLY,
        allowNull: true,
        validate: {
          isDate: true,
        },
      },     
      ownership_source: {
        type: DataTypes.TEXT,
        allowNull: true,
      },
  
    });
    return Ownership;
  };
  
  export default getOwnershipModel;
  