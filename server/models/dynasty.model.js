const getDynastyModel = (sequelize, { DataTypes }) => {
  const Dynasty = sequelize.define('dynasty', {
    dynasty_id: {
      type: DataTypes.INTEGER,
      unique: true,
      allowNull: false,
    },
    dynasty_name: {
      type: DataTypes.STRING,
      unique: false,
      allowNull: false,
    },
    dynasty_head: {
      type: DataTypes.INTEGER,
      unique: false,
      allowNull: true,
    },
    dynasty_creator_id: {
      type: DataTypes.INTEGER,
      unique: true,
      allowNull: true,
    },
    dynasty_start: {
      type: DataTypes.DATEONLY,
      unique: false,
      allowNull: true,
    },
  });

  return Dynasty;
};

export default getDynastyModel;

// https://www.robinwieruch.de/postgres-express-setup-tutorial/#:~:text=To%20connect%20PostgreSQL%20to%20your%20Express%20application%2C%20we,programmers%20use%20to%20convert%20data%20among%20incompatible%20types.