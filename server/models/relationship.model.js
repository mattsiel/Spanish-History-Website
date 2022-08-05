CREATE TABLE "relationship" (
	"relationship_id" serial NOT NULL UNIQUE,
	"relationship_type" varchar NOT NULL,
	"relationship_start" DATE,
	"relationship_end" DATE,
	"person_1" integer NOT NULL,
	"person_2" integer NOT NULL,
	"person_1_role" varchar NOT NULL,
	"person_2_role" varchar NOT NULL,
	"relationship_notes" varchar,
	"relationship_source" TEXT,
	CONSTRAINT "relationship_pk" PRIMARY KEY ("relationship_id")
) WITH (
  OIDS=FALSE
);

const getRelationshipModel = (sequelize, { DataTypes }) => {
    const Relationship = sequelize.define('relationship', {
      relationship_name: {
        type: DataTypes.STRING(100),
        allowNull: false,
        validate: {
          notEmpty: true,
          notNull: true,
          isAlpha: true, 
        },
      },
      relationship_head: {
        type: DataTypes.INTEGER,
        allowNull: true,
        validate: {
          isInt: true,
        },
      },
      relationship_creator_id: {
        type: DataTypes.INTEGER,
        allowNull: true,
        validate: {
          isInt: true,
        },
      },
      relationship_start: {
        type: DataTypes.DATEONLY,
        allowNull: true,
        validate: {
          isDate: true,
        },
      },
  
    });
    return Relationship;
  };
  
  export default getRelationshipModel;
  