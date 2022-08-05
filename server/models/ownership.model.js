
CREATE TABLE "ownership" (
	"ownership_id" serial NOT NULL,
	"property_id" integer NOT NULL,
	"person_id" integer NOT NULL,
	"ownership_start" DATE,
	"ownership_end" DATE,
	"ownership_source" TEXT,
	CONSTRAINT "ownership_pk" PRIMARY KEY ("ownership_id")
) WITH (
  OIDS=FALSE
);


const getOwnershipModel = (sequelize, { DataTypes }) => {
    const Ownership = sequelize.define('ownership', {
      ownership_name: {
        type: DataTypes.STRING(100),
        allowNull: false,
        validate: {
          notEmpty: true,
          notNull: true,
          isAlpha: true, 
        },
      },
      ownership_head: {
        type: DataTypes.INTEGER,
        allowNull: true,
        validate: {
          isInt: true,
        },
      },
      ownership_creator_id: {
        type: DataTypes.INTEGER,
        allowNull: true,
        validate: {
          isInt: true,
        },
      },
      ownership_start: {
        type: DataTypes.DATEONLY,
        allowNull: true,
        validate: {
          isDate: true,
        },
      },
  
    });
    return Ownership;
  };
  
  export default getOwnershipModel;
  