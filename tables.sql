CREATE TABLE country_tbl (
    country_id int NOT NULL,
    country_name varchar(255),
    PRIMARY KEY (country_id)
);

CREATE TABLE state_provence_tbl (
    state_provence_id int NOT NULL,
    state_provence_name varchar(255),
    country_id int,
    PRIMARY KEY (state_id),
    CONSTRAINT FK_country_tbl FOREIGN KEY (country_id)
    REFERENCES country_tbl(country_id)
);

CREATE TABLE postal_code_tbl (
    postal_code_id int NOT NULL,
    postal_code varchar(255),
    state_provence_id int,
    PRIMARY KEY (county_id),
    CONSTRAINT FK_state_provedence_tbl FOREIGN KEY (county_id)
    REFERENCES state_provedence_tbl(state_id)
);

CREATE TABLE county_tbl (
    county_id int NOT NULL,
    county_name varchar(255),
    state_provence_id int,
    PRIMARY KEY (county_id),
    CONSTRAINT FK_state_provedence_tbl FOREIGN KEY (state_id)
    REFERENCES state_tbl(state_id)
);

CREATE TABLE city_tbl (
    city_id int NOT NULL,
    city_name varchar(255),
    state_provence_id int,
    country_id int NOT NULL,
    PRIMARY KEY (city_id),
    CONSTRAINT FK_country_tbl FOREIGN KEY (country_id)
    REFERENCES country_tbl(country_id),
    CONSTRAINT FK_state_provedence_tbl FOREIGN KEY (state_id)
    REFERENCES state_tbl(state_id)
);

CREATE TABLE address_tbl  (
    address_id int NOT NULL,
    address varchar(255),
    address_2 varchar(255),
    city_id int,
    postal_code_id int,
    county_id int,
    state_provence_id int,
    country_id int,
    PRIMARY KEY (address_id),
    CONSTRAINT FK_city FOREIGN KEY (city_id)
    REFERENCES city_tbl(city_id),
    CONSTRAINT FK_postal_code_tbl FOREIGN KEY (postal_code_id)
    REFERENCES postal_code_tbl(postal_code_id),
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
