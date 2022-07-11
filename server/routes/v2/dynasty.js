const getUserModel = (sequelize, { DataTypes }) => {
  const Dynasty = sequelize.define('dynasty', {
    dynasty_id: {
      type: DataTypes.SERIAL,
      unique: true,
      allowNull: false,
    },
    dynasty_name: {
      type: DataTypes.SERIAL,
      unique: true,
      allowNull: false,
    },
    dynasty_head: {

    },
    dynasty_creator_id: {

    },
    dynasty_start: {

    }
  });

  User.associate = (models) => {
    User.hasMany(models.Message, { onDelete: 'CASCADE' });
  };

  User.findByLogin = async (login) => {
    let user = await User.findOne({
      where: { username: login },
    });

    if (!user) {
      user = await User.findOne({
        where: { email: login },
      });
    }

    return user;
  };

  return User;
};

export default getUserModel;