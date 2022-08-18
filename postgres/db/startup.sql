CREATE TABLE "person" (
	"person_id" serial NOT NULL UNIQUE,
	"name_first" varchar NOT NULL,
	"name_by" varchar,
	"name_middle" varchar,
	"name_maiden" varchar(255),
	"name_last" varchar,
	"gender" char(1) NOT NULL,
	"date_birth" DATE,
	"date_death" DATE,
	"place_birth" varchar,
	"place_death" varchar,
	"cause_death" varchar,
	"family_id" integer,
	"person_source" TEXT,
	"dynasty_id" integer,
	CONSTRAINT "person_pk" PRIMARY KEY ("person_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "family" (
	"family_id" serial NOT NULL UNIQUE,
	"family_name" varchar(100) NOT NULL,
	"family_name" varchar(50) NOT NULL,
	"dynasty_id" integer,
	"family_head" integer,
	"family_creator_id" integer,
	"family_start" DATE,
	"cadet_of" integer,
	CONSTRAINT "family_pk" PRIMARY KEY ("family_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "dynasty" (
	"dynasty_id" serial NOT NULL UNIQUE,
	"dynasty_name" varchar NOT NULL,
	"dynasty_head" integer,
	"dynasty_creator_id" integer,
	"dynasty_start" DATE,
	CONSTRAINT "dynasty_pk" PRIMARY KEY ("dynasty_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "occupation" (
	"occupation_id" serial NOT NULL UNIQUE,
	"occupation_type" varchar NOT NULL,
	"occupation_start" DATE,
	"occupation_end" DATE,
	"occupation_info" TEXT,
	"person_id" integer NOT NULL,
	CONSTRAINT "occupation_pk" PRIMARY KEY ("occupation_id")
) WITH (
  OIDS=FALSE
);



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



CREATE TABLE "ownership" (
	"ownership_id" serial NOT NULL UNIQUE,
	"property_id" integer NOT NULL,
	"person_id" integer NOT NULL,
	"ownership_start" DATE,
	"ownership_end" DATE,
	"ownership_source" TEXT,
	CONSTRAINT "ownership_pk" PRIMARY KEY ("ownership_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "parent" (
	"parent_id" serial NOT NULL UNIQUE,
	"person_id" integer NOT NULL,
	"parent_person_id" integer NOT NULL,
	"parent_type" varchar NOT NULL,
	CONSTRAINT "parent_pk" PRIMARY KEY ("parent_id")
) WITH (
  OIDS=FALSE
);

CREATE TABLE "location" (
	"location_id" serial NOT NULL UNIQUE,
	"location_name" varchar NOT NULL,
	"location_alt_names" varchar,
	"population" integer,
	"location_north" decimal(10, 2) NOT NULL,
	"location_east" decimal(10, 2) NOT NULL,
	"location_info" TEXT,
	"location_sources" TEXT,
	CONSTRAINT "location_pk" PRIMARY KEY ("location_id")
) WITH (
  OIDS=FALSE
);

CREATE TABLE "title" (
	"title_id" serial NOT NULL UNIQUE,
	"title_name" varchar NOT NULL,
	"title_rank" varchar NOT NULL,
	"title_holders" varchar [],
	"title_holder_start" DATE [],
	"title_holder_end" DATE [],
	"part_of" varchar,
	"title_info" TEXT,
	"title_sources" TEXT,
	CONSTRAINT "title_pk" PRIMARY KEY ("title_id")
) WITH (
  OIDS=FALSE
);


ALTER TABLE "person" ADD CONSTRAINT "person_fk0" FOREIGN KEY ("family_id") REFERENCES "family"("family_id");
ALTER TABLE "person" ADD CONSTRAINT "person_fk1" FOREIGN KEY ("dynasty_id") REFERENCES "dynasty"("dynasty_id");

ALTER TABLE "family" ADD CONSTRAINT "family_fk0" FOREIGN KEY ("dynasty_id") REFERENCES "dynasty"("dynasty_id");
ALTER TABLE "family" ADD CONSTRAINT "family_fk1" FOREIGN KEY ("family_head") REFERENCES "person"("person_id");
ALTER TABLE "family" ADD CONSTRAINT "family_fk2" FOREIGN KEY ("family_creator_id") REFERENCES "person"("person_id");

ALTER TABLE "dynasty" ADD CONSTRAINT "dynasty_fk0" FOREIGN KEY ("dynasty_head") REFERENCES "person"("person_id");
ALTER TABLE "dynasty" ADD CONSTRAINT "dynasty_fk1" FOREIGN KEY ("dynasty_creator_id") REFERENCES "person"("person_id");

ALTER TABLE "occupation" ADD CONSTRAINT "occupation_fk0" FOREIGN KEY ("person_id") REFERENCES "person"("person_id");

ALTER TABLE "relationship" ADD CONSTRAINT "relationship_fk0" FOREIGN KEY ("person_1") REFERENCES "person"("person_id");
ALTER TABLE "relationship" ADD CONSTRAINT "relationship_fk1" FOREIGN KEY ("person_2") REFERENCES "person"("person_id");

ALTER TABLE "property" ADD CONSTRAINT "property_fk0" FOREIGN KEY ("property_creator_id") REFERENCES "person"("person_id");

ALTER TABLE "ownership" ADD CONSTRAINT "ownership_fk0" FOREIGN KEY ("property_id") REFERENCES "property"("property_id");
ALTER TABLE "ownership" ADD CONSTRAINT "ownership_fk1" FOREIGN KEY ("person_id") REFERENCES "person"("person_id");

ALTER TABLE "parent" ADD CONSTRAINT "parent_fk0" FOREIGN KEY ("person_id") REFERENCES "person"("person_id");
ALTER TABLE "parent" ADD CONSTRAINT "parent_fk1" FOREIGN KEY ("parent_person_id") REFERENCES "person"("person_id");









