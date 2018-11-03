CREATE TABLE country_tbl (
    country_id int NOT NULL,
    country_name varchar(255),
    PRIMARY KEY (country_id)
);

CREATE TABLE state_tbl (
    state_id int NOT NULL,
    state_name varchar(255),
    PRIMARY KEY (state_id)
);

CREATE TABLE city_tbl (
    city_id int NOT NULL,
    city_name varchar(255),
    state_id int,
    country_id int NOT NULL,
    PRIMARY KEY (city_id),
    CONSTRAINT FK_state_tbl FOREIGN KEY (state_id)
    REFERENCES state_tbl(state_id),
    CONSTRAINT FK_country_tbl FOREIGN KEY (country_id)
    REFERENCES country_tbl(country_id)
);

CREATE TABLE address_tbl  (
    address_id int NOT NULL,
    address varchar(255),
    address_2 varchar(255),
    city_id int,
    postal_code varchar(255),
    state_id int,
    country_id int,
    PRIMARY KEY (address_id),
    CONSTRAINT FK_city FOREIGN KEY (city_id)
    REFERENCES city_tbl(city_id),
    CONSTRAINT FK_state FOREIGN KEY (state_id)
    REFERENCES state_tbl(state_id),
    CONSTRAINT FK_country FOREIGN KEY (country_id)
    REFERENCES country_tbl(country_id) 
);

CREATE TABLE person_tbl (
    person_id int NOT NULL,
    first_name varchar(255),
    last_name varchar(255),
    middle_name varchar(255),
    address_id int,
    PRIMARY KEY (person_id),
    CONSTRAINT KF_address_tbl FOREIGN KEY (address_id)
    REFERENCES address_tbl(address_id)
);
