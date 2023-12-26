CREATE TABLE IF NOT EXISTS teams (
    id BIGSERIAL PRIMARY KEY NOT NULL,
    name VARCHAR,
    created_at TIMESTAMP,
    country VARCHAR
);

CREATE TABLE IF NOT EXISTS users (
    id BIGSERIAL PRIMARY KEY NOT NULL,
    nickname VARCHAR(20),
    full_name VARCHAR(100),
    team_id BIGSERIAL NOT NULL,
    created_at TIMESTAMP,

    FOREIGN KEY (team_id) REFERENCES teams(id)
);

CREATE TABLE IF NOT EXISTS folders(
    id BIGSERIAL PRIMARY KEY NOT NULL,
    name VARCHAR,
    team_id BIGSERIAL,

    FOREIGN KEY (team_id) REFERENCES teams(id)
);

CREATE TABLE IF NOT EXISTS categories(
    id BIGSERIAL PRIMARY KEY NOT NULL,
    name VARCHAR
);

CREATE TABLE IF NOT EXISTS items(
    id BIGSERIAL PRIMARY KEY NOT NULL,
    name VARCHAR NOT NULL,
    quantity INT NOT NULL,
    price DOUBLE PRECISION,
    description TEXT,
    category_id BIGSERIAL,
    folder_id BIGSERIAL NOT NULL,

    FOREIGN KEY (category_id) REFERENCES categories(id),
    FOREIGN KEY (folder_id) REFERENCES folders(id)
);

CREATE TABLE IF NOT EXISTS updates(
    id BIGSERIAL PRIMARY KEY NOT NULL,
    quantity_change INT,
    item_id BIGSERIAL,

    FOREIGN KEY (item_id) REFERENCES items(id)
);