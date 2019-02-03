
-- DROP DATABASE web_customer_tracker;

CREATE DATABASE web_customer_tracker
  WITH OWNER = postgres
       ENCODING = 'UTF8'
       TABLESPACE = pg_default
       LC_COLLATE = 'English_India.1252'
       LC_CTYPE = 'English_India.1252'
       CONNECTION LIMIT = -1;

-- DROP TABLE public.users;

CREATE TABLE public.users
(
  username varchar(45) NOT NULL,
  password varchar(60) NOT NULL,
  enabled boolean NOT NULL DEFAULT true,
  CONSTRAINT users_pkey PRIMARY KEY (username)
);

-- DROP TABLE public.user_roles;

CREATE TABLE public.user_roles
(
  user_role_id serial not null,
  username varchar(45) NOT NULL,
  role varchar(45) NOT NULL,
  CONSTRAINT user_roles_pkey PRIMARY KEY (user_role_id),
  CONSTRAINT fk_username FOREIGN KEY (username)
      REFERENCES public.users (username) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT uni_username_role UNIQUE (role, username)
);

--Abcd1234
insert into users values('murugeswari', '$2a$10$peOx5peJqfOB5LJ6VzxNRuaW0jHmYzE1p2MyYDOFrJyn.q0z50oEG', true);
insert into user_roles (username,role) values ('murugeswari', 'ROLE_EMPLOYEE');

--DROP TABLE public.customer;

CREATE TABLE customer (
  id serial NOT NULL,
  first_name varchar(45) DEFAULT NULL,
  last_name varchar(45) DEFAULT NULL,
  email varchar(45) DEFAULT NULL,
  PRIMARY KEY (id)
);



