CREATE TABLE accommodation (
	id SERIAL PRIMARY KEY,
	title VARCHAR(60) UNIQUE NOT NULL,
	description VARCHAR(280),
	price INT,
    user_id INT,
	FOREIGN KEY(user_id)
	REFERENCES users(id));