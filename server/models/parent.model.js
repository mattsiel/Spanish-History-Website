
CREATE TABLE "parent" (
	"parent_id" serial NOT NULL,
	"person_id" integer NOT NULL,
	"parent_person_id" integer NOT NULL,
	"parent_type" varchar NOT NULL,
	CONSTRAINT "parent_pk" PRIMARY KEY ("parent_id")
) WITH (
  OIDS=FALSE
);

const getParentModel = (sequelize, { DataTypes }) => {
    const Parent = sequelize.define('parent', {
      parent_name: {
        type: DataTypes.STRING(100),
        allowNull: false,
        validate: {
          notEmpty: true,
          notNull: true,
          isAlpha: true, 
        },
      },
      parent_head: {
        type: DataTypes.INTEGER,
        allowNull: true,
        validate: {
          isInt: true,
        },
      },
      parent_creator_id: {
        type: DataTypes.INTEGER,
        allowNull: true,
        validate: {
          isInt: true,
        },
      },
      parent_start: {
        type: DataTypes.DATEONLY,
        allowNull: true,
        validate: {
          isDate: true,
        },
      },
  
    });
    return Parent;
  };
  
  export default getParentModel;
  