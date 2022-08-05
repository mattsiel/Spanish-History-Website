const getPersonModel = (sequelize, { DataTypes }) => {
  const Person = sequelize.define('person', {
    name_first: {
      type: DataTypes.STRING(100),
      allowNull: false,
      validate: {
        notEmpty: true,
        notNull: true,
        isAlpha: true, 
      },
    },
    name_by: {
      type: DataTypes.STRING(100),
      allowNull: true,
      validate: {
        isAlpha: true, 
      },
    },
    name_middle: {
      type: DataTypes.STRING(100),
      allowNull: true,
      validate: {
        isAlpha: true, 
      },
    },
    name_maiden: {
      type: DataTypes.STRING(100),
      allowNull: true,
      validate: {
        isAlpha: true, 
      },
    },
    name_last: {
      type: DataTypes.STRING(100),
      allowNull: true,
      validate: {
        isAlpha: true, 
      },
    },
    gender: {
      type: DataTypes.CHAR(1),
      allowNull: true,
      validate: {
        isInt: true,
      },
    },
    date_birth: {
      type: DataTypes.DATEONLY,
      allowNull: true,
      validate: {
        isDate: true,
      },
    },
    date_death: {
      type: DataTypes.DATEONLY,
      allowNull: true,
      validate: {
        isDate: true,
      },
    },
    place_birth: {
      type: DataTypes.STRING(100),
      allowNull: true,
      validate: {
        isAlpha: true, 
      },
    },
    place_death: {
      type: DataTypes.STRING(100),
      allowNull: true,
      validate: {
        isAlpha: true, 
      },
    },
    cause_death: {
      type: DataTypes.STRING(100),
      allowNull: true,
      validate: {
        isAlpha: true, 
      },
    },
    family_id: {
      type: DataTypes.INTEGER,
      allowNull: true,
      validate: {
        isInt: true,
      },
    },
    person_source: {
      type: DataTypes.TEXT,
      allowNull: true,
    },
    dynasty_id: {
      type: DataTypes.INTEGER,
      allowNull: true,
      validate: {
        isInt: true,
      },
    },

  });
  return Person;
};

export default getPersonModel;


  /*
  Person.associate = (models) => {
    Person.hasMany(models.Message, { onDelete: 'CASCADE' });
  };
  */