const getPersonModel = (sequelize, { DataTypes }) => {
  const Person = sequelize.define('person', {
    personname: {
      type: DataTypes.STRING,
      unique: true,
      allowNull: false,
      validate: {
        notEmpty: true,
      },
    },
  });

  Person.associate = (models) => {
    Person.hasMany(models.Message, { onDelete: 'CASCADE' });
  };

  Person.findByLogin = async (login) => {
    let person = await Person.findOne({
      where: { personname: login },
    });

    if (!person) {
      person = await Person.findOne({
        where: { email: login },
      });
    }

    return person;
  };

  return Person;
};

export default getPersonModel;
