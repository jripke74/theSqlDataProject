CREATE DATABASE places_db;

USE places_db;

CREATE TABLE continent_tbl (
    continent_name varchar(13) NOT NULL,
    continent_area int,
    continent_contries int,
    continent_coordinates varchar(40),
    PRIMARY KEY (continent_name)
);

CREATE TABLE country_tbl (
    country_iso_code int NOT NULL,
    country_name varchar(13),
    country_cordinates varchar(30),
    country_area varchar(10),
    continent_name varchar(255),
    PRIMARY KEY (country_iso_code),
    CONSTRAINT FK_continent_tbl FOREIGN KEY (continent_name)
    REFERENCES continent_tbl(continent_name)
);

CREATE TABLE state_provence_tbl (
    state_provence_id int NOT NULL,
    state_provence_name varchar(255),
    country_iso_code int,
    PRIMARY KEY (state_provence_id),
    CONSTRAINT FK_country_tbl FOREIGN KEY (country_iso_code)
    REFERENCES country_tbl(country_iso_code)
);

CREATE TABLE postal_code_tbl (
    postal_code_id int NOT NULL,
    postal_code varchar(255),
    state_provence_id int,
    PRIMARY KEY (postal_code_id),
    CONSTRAINT FK_state_provedence_tbl FOREIGN KEY (state_provence_id)
    REFERENCES state_provence_tbl(state_provence_id)
);

CREATE TABLE county_tbl (
    county_id int NOT NULL,
    county_name varchar(255),
    state_provence_id int,
    PRIMARY KEY (county_id),
    CONSTRAINT FK_state_provence_tbl FOREIGN KEY (state_provence_id)
    REFERENCES state_provence_tbl(state_provence_tbl)
);

CREATE TABLE city_tbl (
    city_id int NOT NULL,
    city_name varchar(255),
    state_provence_id int,
    country_iso_code int NOT NULL,
    PRIMARY KEY (city_id),
    CONSTRAINT FK_country_tbl FOREIGN KEY (country_iso_code)
    REFERENCES country_tbl(country_iso_code),
    CONSTRAINT FK_state_provedence_tbl FOREIGN KEY (state_provence_id)
    REFERENCES state_provence_tbl(state_provence_tbl)
);

CREATE TABLE coordinates_tbl (
    coordinates_id int NOT NULL,
    lat varchar(255),
    longg varchar(255),
    PRIMARY KEY (coordinates_id)
);

CREATE TABLE address_tbl  (
    address_id int NOT NULL,
    address varchar(255),
    address_2 varchar(255),
    city_id int,
    postal_code_id int,
    country_iso_code int,
    state_provence_id int,
    country_id int,
    coordinates_id int,
    PRIMARY KEY (address_id),
    CONSTRAINT FK_city FOREIGN KEY (city_id)
    REFERENCES city_tbl(city_id),
    CONSTRAINT FK_postal_code_tbl FOREIGN KEY (postal_code_id)
    REFERENCES postal_code_tbl(postal_code_id),
    CONSTRAINT FK_state FOREIGN KEY (state_provence_id)
    REFERENCES state_provence_tbl(state_provence_id),
    CONSTRAINT FK_country FOREIGN KEY (country_id)
    REFERENCES country_tbl(country_id)
);
