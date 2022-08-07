
const getOccupationModel = (sequelize, { DataTypes }) => {
    const Occupation = sequelize.define('occupation', {
      occupation_type: {
        type: DataTypes.STRING(100),
        allowNull: false,
        validate: {
          notEmpty: true,
          notNull: true,
          isAlpha: true, 
        },
      },
      occupation_start: {
        type: DataTypes.DATEONLY,
        allowNull: true,
        validate: {
          isDate: true,
        },
      },
      occupation_end: {
        type: DataTypes.DATEONLY,
        allowNull: true,
        validate: {
          isDate: true,
        },
      },

      occupation_info: {
        type: DataTypes.TEXT,
        allowNull: true,
      },

      person_id: {
        type: DataTypes.INTEGER,
        allowNull: false,
        validate: {
          notNull: true,
          isInt: true,
        },
      },
  
    });
    return Occupation;
  };
  
  export default getOccupationModel;
  