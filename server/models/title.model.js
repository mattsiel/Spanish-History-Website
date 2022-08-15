
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
      title_rank: {
        type: DataTypes.INTEGER,
        allowNull: true,
        validate: {
          isInt: true,
        },
      },

      title_holders: {
        type: DataTypes.ARRAY(DataTypes.INTEGER),
        allowNull: true,
        validate: {
          isInt: true,
        },
      },
      title_holder_start: {
        type: DataTypes.ARRAY(DataTypes.DATEONLY),
        allowNull: true,
        validate: {
          isDate: true,
        },
      },
      title_holder_end: {
        type: DataTypes.ARRAY(DataTypes.DATEONLY),
        allowNull: true,
        validate: {
          isInt: true,
        },
      },
      part_of: {
        type: DataTypes.INTEGER,
        allowNull: true,
        validate: {
          isInt: true,
        },
      },
      title_info: {
        type: DataTypes.TEXT,
        allowNull: true,
      },
  
    });
    return Title;
  };
  
  export default getTitleModel;
  