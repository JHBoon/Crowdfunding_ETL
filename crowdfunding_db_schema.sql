-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/mboBPt
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


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

CREATE TABLE "Campaign" (
    "cf_id" varchar(10)   NOT NULL,
    "contact_id" varchar(30)   NOT NULL,
    "company_name" varchar(50)   NOT NULL,
    "description" varchar(50)   NOT NULL,
    "goal" float   NOT NULL,
    "pledged" float   NOT NULL,
    "outcome" varchar(20)   NOT NULL,
    "backers_count" int   NOT NULL,
    "country" varchar(2)   NOT NULL,
    "currency" varchar(3)   NOT NULL,
    "launch_date" smalldatetime   NOT NULL,
    "end_date" smalldatetime   NOT NULL,
    "category_id" varchar(10)   NOT NULL,
    "subcategory_id" varchar(10)   NOT NULL,
    CONSTRAINT "pk_Campaign" PRIMARY KEY (
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

