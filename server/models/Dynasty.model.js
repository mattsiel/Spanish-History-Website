const getDynastyModel = (sequelize, { DataTypes }) => {
  const Dynasty = sequelize.define('dynasty', {
    dynasty_name: {
      type: DataTypes.STRING(100),
      allowNull: false,
    },
    dynasty_head: {
      type: DataTypes.INTEGER,
      allowNull: true,
    },
    dynasty_creator_id: {
      type: DataTypes.INTEGER,
      allowNull: true,
    },
    dynasty_start: {
      type: DataTypes.DATEONLY,
      allowNull: true,
    },

  });
  return Dynasty;
};

export default getDynastyModel;
