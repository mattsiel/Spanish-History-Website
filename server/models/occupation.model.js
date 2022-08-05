

CREATE TABLE "occupation" (
	"occupation_id" serial NOT NULL UNIQUE,
	"occupation_type" varchar NOT NULL,
	"occupation_start" DATE,
	"occupation_end" DATE,
	"person_id" integer NOT NULL,
	CONSTRAINT "occupation_pk" PRIMARY KEY ("occupation_id")
) WITH (
  OIDS=FALSE
);


const getOccupationModel = (sequelize, { DataTypes }) => {
    const Occupation = sequelize.define('occupation', {
      occupation_name: {
        type: DataTypes.STRING(100),
        allowNull: false,
        validate: {
          notEmpty: true,
          notNull: true,
          isAlpha: true, 
        },
      },
      occupation_head: {
        type: DataTypes.INTEGER,
        allowNull: true,
        validate: {
          isInt: true,
        },
      },
      occupation_creator_id: {
        type: DataTypes.INTEGER,
        allowNull: true,
        validate: {
          isInt: true,
        },
      },
      occupation_start: {
        type: DataTypes.DATEONLY,
        allowNull: true,
        validate: {
          isDate: true,
        },
      },
  
    });
    return Occupation;
  };
  
  export default getOccupationModel;
  