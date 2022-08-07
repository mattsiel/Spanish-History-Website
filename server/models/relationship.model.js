
const getRelationshipModel = (sequelize, { DataTypes }) => {
    const Relationship = sequelize.define('relationship', {
      relationship_type: {
        type: DataTypes.STRING(100),
        allowNull: false,
        validate: {
          notEmpty: true,
          notNull: true,
          isAlpha: true, 
        },
      },
      relationship_start: {
        type: DataTypes.DATEONLY,
        allowNull: true,
        validate: {
          isDate: true,
        },
      },
      relationship_end: {
        type: DataTypes.DATEONLY,
        allowNull: true,
        validate: {
          isDate: true,
        },
      },
      person_1: {
        type: DataTypes.INTEGER,
        allowNull: false,
        validate: {
          isInt: true,
          notNull: true,
        },
      },
      person_2: {
        type: DataTypes.INTEGER,
        allowNull: false,
        validate: {
          isInt: true,
          notNull: true,
        },
      },
      person_1_role: {
        type: DataTypes.STRING(100),
        allowNull: false,
        validate: {
          notEmpty: true,
          notNull: true,
          isAlpha: true, 
        },
      },
      person_2_role: {
        type: DataTypes.STRING(100),
        allowNull: false,
        validate: {
          notEmpty: true,
          notNull: true,
          isAlpha: true, 
        },
      },
      relationship_notes: {
        type: DataTypes.TEXT,
        allowNull: true,
      },
      relationship_source: {
        type: DataTypes.TEXT,
        allowNull: true,
      },
    });
    return Relationship;
  };
  
  export default getRelationshipModel;
  