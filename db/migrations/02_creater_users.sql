CREATE TABLE users (id SERIAL PRIMARY KEY,name VARCHAR(60),username VARCHAR(60) UNIQUE NOT NULL,email VARCHAR(60),password VARCHAR(60))