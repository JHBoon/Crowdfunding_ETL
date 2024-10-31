-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/mboBPt
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- COPY Campaign FROM '/Users/surjunk/Documents/JUST PrIve/JUST USA/Class work Berkeley Extention Data Analytics Bootcamp/WORK HERE/13-Project-2-ETL/etl_project_2_starter_files/Final Documents/campaign.csv' DELIMITER ',' CSV HEADER;

CREATE TABLE "Categories" (
    "category_id" varchar(10)   NOT NULL,
    "category" varchar(30)   NOT NULL,
    CONSTRAINT "pk_Categories" PRIMARY KEY (
        "category_id"
     )
);

CREATE TABLE "Subcategories" (
    "subcategory_id" varchar(10)   NOT NULL,
    "subcategory" varchar(30)   NOT NULL,
    CONSTRAINT "pk_Subcategories" PRIMARY KEY (
        "subcategory_id"
     )
);

DROP TABLE IF EXISTS "campaign";
CREATE TABLE "campaign" (
    "cf_id" varchar(10)   NOT NULL,
    "contact_id" varchar(30)   NOT NULL,
    "company_name" varchar(100)   NOT NULL,
    "description"  varchar(100)  NOT NULL,
    "goal"  varchar(100) NOT NULL,
    "pledged" NUMERIC(10,2)   NOT NULL,
    "outcome" varchar(20)   NOT NULL,
    "backers_count" int   NOT NULL,
    "country" varchar(10)   NOT NULL,
    "currency" varchar(3)   NOT NULL,
    "launch_date" timestamp   NOT NULL,
    "end_date" timestamp   NOT NULL,
    "category_id" varchar(10)   NOT NULL,
    "subcategory_id" varchar(10)   NOT NULL,
    CONSTRAINT pk_Campaign PRIMARY KEY (
        "cf_id"
     )
);

CREATE TABLE "Contacts" (
    "contact_id" varchar(10)   NOT NULL,
    "first_name" varchar(30)   NOT NULL,
    "last_name" varchar(30)   NOT NULL,
    "email" varchar(50)   NOT NULL,
    CONSTRAINT "pk_Contacts" PRIMARY KEY (
        "contact_id"
     )
);


ALTER TABLE "Campaign" ADD CONSTRAINT "fk_Campaign_contact_id" FOREIGN KEY("contact_id")
REFERENCES "Contacts" ("contact_id");

ALTER TABLE "Campaign" ADD CONSTRAINT "fk_Campaign_category_id" FOREIGN KEY("category_id")
REFERENCES "Categories" ("category_id");

ALTER TABLE "Campaign" ADD CONSTRAINT "fk_Campaign_subcategory_id" FOREIGN KEY("subcategory_id")
REFERENCES "Subcategories" ("subcategory_id");

-- Testing if tables are created with data

SELECT * from "Categories";
SELECT * from "Subcategories";
SELECT * from "Contacts";
SELECT * from campaign;
