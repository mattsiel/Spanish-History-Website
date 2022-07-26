const getFamilyModel = (sequelize, { DataTypes }) => {
  const User = sequelize.define('user', {
    username: {
      type: DataTypes.STRING,
      unique: true,
      allowNull: false,
      validate: {
        notEmpty: true,
      },
    },
  });

  return User;
};

export default getUserModel;

// https://www.robinwieruch.de/postgres-express-setup-tutorial/#:~:text=To%20connect%20PostgreSQL%20to%20your%20Express%20application%2C%20we,programmers%20use%20to%20convert%20data%20among%20incompatible%20types.