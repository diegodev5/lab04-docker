CREATE TABLE clientes (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    correo VARCHAR(150) NOT NULL
);

CREATE TABLE productos (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    precio NUMERIC(10,2) NOT NULL,
    stock INTEGER NOT NULL
);

INSERT INTO clientes (nombre, correo)
SELECT
    'Cliente ' || codigo,
    'cliente' || codigo || '@example.com'
FROM (
    SELECT g, floor(random() * 1000000)::int AS codigo
    FROM generate_series(1, 10) AS g
) AS datos;

INSERT INTO productos (nombre, precio, stock)
SELECT
    'Producto ' || g,
    round((10 + random() * 490)::numeric, 2),
    floor(random() * 100)::int
FROM generate_series(1, 10) AS g;
