
C

const getParentModel = (sequelize, { DataTypes }) => {
    const Parent = sequelize.define('parent', {
      person_id: {
        type: DataTypes.INTEGER,
        allowNull: false,
        validate: {
          isInt: true,
        },
      },
      parent_person_id: {
        type: DataTypes.INTEGER,
        allowNull: false,
        validate: {
          isInt: true,
        },
      },
      parent_type: {
        type: DataTypes.STRING,
        allowNull: false,
        validate: {
          isAlpha: true,
        },
      },
  
    });
    return Parent;
  };
  
  export default getParentModel;
  