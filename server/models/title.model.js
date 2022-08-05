
const getTitleModel = (sequelize, { DataTypes }) => {
    const Title = sequelize.define('title', {
      title_name: {
        type: DataTypes.STRING(100),
        allowNull: false,
        validate: {
          notEmpty: true,
          notNull: true,
          isAlpha: true, 
        },
      },
      title_head: {
        type: DataTypes.INTEGER,
        allowNull: true,
        validate: {
          isInt: true,
        },
      },
      title_creator_id: {
        type: DataTypes.INTEGER,
        allowNull: true,
        validate: {
          isInt: true,
        },
      },
      title_start: {
        type: DataTypes.DATEONLY,
        allowNull: true,
        validate: {
          isDate: true,
        },
      },
  
    });
    return Title;
  };
  
  export default getTitleModel;
  