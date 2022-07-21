CREATE TABLE "users" (
  "id" int PRIMARY KEY,
  "name" varchar,
  "fullname" varchar(100),
  "email" varchar UNIQUE NOT NULL
);

CREATE TABLE "products" (
  "id" int PRIMARY KEY,
  "category_id" int
);

CREATE TABLE "categories" (
  "id" int PRIMARY KEY
);

CREATE TABLE "sellers" (
  "id" int PRIMARY KEY,
  "area" varchar,
  "user_id" int
);

CREATE TABLE "orders" (
  "id" int PRIMARY KEY,
  "user_id" int,
  "product_id" int
);

COMMENT ON COLUMN "users"."name" IS 'user name';

COMMENT ON COLUMN "users"."fullname" IS 'this is fullname';

ALTER TABLE "categories" ADD FOREIGN KEY ("id") REFERENCES "products" ("category_id");

ALTER TABLE "users" ADD FOREIGN KEY ("id") REFERENCES "sellers" ("user_id");

ALTER TABLE "orders" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "orders" ADD FOREIGN KEY ("product_id") REFERENCES "products" ("id");
