ALTER TABLE accommodation
ADD COLUMN user_id int REFERENCES users(id)