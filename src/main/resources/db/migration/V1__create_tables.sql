create table ingredients
(
  id bigserial not null constraint ingredients_pkey primary key,
  ingredient_name varchar(100) not null,
  ingredient_description varchar(255),
  price_when_extra decimal
);

alter table ingredients
  owner to postgres;

create table categories(
  id bigserial not null constraint categories_pkey primary key,
  category_name varchar (100) not null,
  category_description varchar (255)
);

alter table categories
  owner to postgres;

create table sub_categories(
  id bigserial not null constraint sub_categories_pkey primary key,
  sub_category_name varchar (100),
  sub_category_description varchar(255),
  category_id bigserial NOT NULL
);

alter table sub_categories
  owner to postgres;

create table products
(
    id bigserial NOT NULL,
    sub_category_id bigserial NOT NULL,
    ingredient_id bigserial NOT NULL,
    product_name character varying(100) NOT NULL,
    product_description character varying(255),
    price numeric,
    quantity numeric,
    CONSTRAINT products_pkey PRIMARY KEY (id),
    CONSTRAINT ingredients_fkey FOREIGN KEY (ingredient_id)
        REFERENCES quickorder.ingredients (id) MATCH FULL
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT sub_category_fkey FOREIGN KEY (sub_category_id)
        REFERENCES quickorder.sub_categories (id) MATCH FULL
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);

alter table products
  owner to postgres;