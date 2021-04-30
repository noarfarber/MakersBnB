CREATE TABLE bookings (
	id SERIAL PRIMARY KEY,
	date DATE,
	host_id INT,
    tenant_id INT,
	FOREIGN KEY(host_id)
	REFERENCES accommodation(id),
	FOREIGN KEY (tenant_id)
	REFERENCES users(id)
	);