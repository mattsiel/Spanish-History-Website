
CREATE TABLE "property" (
	"property_id" serial NOT NULL UNIQUE,
	"property_size" varchar,
	"property_name" varchar NOT NULL,
	"property_type" varchar NOT NULL,
	"property_creation" DATE,
	"property_start" DATE,
	"property_creator_id" integer,
	CONSTRAINT "property_pk" PRIMARY KEY ("property_id")
) WITH (
  OIDS=FALSE
);

const getPropertyModel = (sequelize, { DataTypes }) => {
    const Property = sequelize.define('property', {
      property_name: {
        type: DataTypes.STRING(100),
        allowNull: false,
        validate: {
          notEmpty: true,
          notNull: true,
          isAlpha: true, 
        },
      },
      property_head: {
        type: DataTypes.INTEGER,
        allowNull: true,
        validate: {
          isInt: true,
        },
      },
      property_creator_id: {
        type: DataTypes.INTEGER,
        allowNull: true,
        validate: {
          isInt: true,
        },
      },
      property_start: {
        type: DataTypes.DATEONLY,
        allowNull: true,
        validate: {
          isDate: true,
        },
      },
  
    });
    return Property;
  };
  
  export default getPropertyModel;
  