CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    phone_number INT NOT NULL UNIQUE,
    username TEXT NOT NULL UNIQUE,
    password TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    manager_id INT NOT NULL
);

CREATE TABLE managers (
    id SERIAL PRIMARY KEY,
    phone_number INT NOT NULL UNIQUE,
    username TEXT NOT NULL UNIQUE,
    password TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
);

CREATE TABLE inventory (
    id SERIAL PRIMARY KEY,
    vin TEXT NOT NULL UNIQUE,
    mileage INT NOT NULL,
    color TEXT NOT NULL,
    make TEXT NOT NULL,
    model TEXT NOT NULL,
    manager_id INT NOT NULL
);

CREATE TABLE leads (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    source TEXT NOT NULL,
    phone_number INT NOT NULL UNIQUE,
    inventory_id INT,
    employee_id INT,
    website_submission_id INT
);

CREATE TABLE website_submission (
    id SERIAL PRIMARY KEY,
    customer_notes TEXT,
);



ALTER TABLE employees
ADD CONSTRAINT fk_employees_manager
FOREIGN KEY (manager_id)
REFERENCES manager (id);

ALTER TABLE inventory
ADD CONSTRAINT fk_inventory_manager
FOREIGN KEY (manger_id)
REFERENCES manager (id);

ALTER TABLE leads
ADD CONSTRAINT fk_leads_inventory
FOREIGN KEY (inventory_id)
REFERENCES inventory (id);

ALTER TABLE leads
ADD CONSTRAINT fk_leads_employee
FOREIGN KEY (employee_id)
REFERENCES employees (id);

ALTER TABLE leads
ADD CONSTRAINT fk_leads_website_submission
FOREIGN KEY (website_submission_id)
REFERENCES website_submission (id);