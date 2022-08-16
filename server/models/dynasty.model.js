const getDynastyModel = (sequelize, { DataTypes }) => {
  const Dynasty = sequelize.define('dynasty', {
    dynasty_name: {
      type: DataTypes.STRING(100),
      allowNull: false,
      validate: {
        notEmpty: true,
        notNull: true,
        isAlpha: true, 
      },
    },
    dynasty_head: {
      type: DataTypes.INTEGER,
      allowNull: true,
      validate: {
        isInt: true,
      },
    },
    dynasty_creator_id: {
      type: DataTypes.INTEGER,
      allowNull: true,
      validate: {
        isInt: true,
      },
    },
    dynasty_start: {
      type: DataTypes.DATEONLY,
      allowNull: true,
      validate: {
        isDate: true,
      },
    },

  });
  return Dynasty;
};

export default getDynastyModel;
