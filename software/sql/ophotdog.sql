CREATE TABLE unit (
       id SERIAL UNIQUE,
       medida TEXT NOT NULL UNIQUE
       );

CREATE TABLE insumo (
       id SERIAL UNIQUE,
       articulo TEXT NOT NULL,
       unit_id INTEGER REFERENCES unit(id),
       stock NUMERIC(9,2) NOT NULL DEFAULT 0,
       min_stock NUMERIC(9,2) NOT NULL DEFAULT 1,
       max_stock NUMERIC(9,2) NOT NULL DEFAULT 1,
       PRIMARY KEY (articulo, unit_id)
       );

CREATE TABLE prod_n (
       id SERIAL UNIQUE,
       t TEXT UNIQUE       
       );

CREATE TABLE prod_i (
       id SERIAL UNIQUE,
       prod_n_id INTEGER REFERENCES prod_n(id),
       insumo_id INTEGER REFERENCES insumo(id),
       PRIMARY KEY (prod_n_id, insumo_id)
       );

CREATE TABLE prod_t (
       id SERIAL UNIQUE,
       prod_n_id INTEGER REFERENCES prod_n(id),
       prod_i_id INTEGER REFERENCES prod_n(id),
       PRIMARY KEY (prod_n_id, prod_i_id),
       CONSTRAINT not_same_prod CHECK (prod_n_id != prod_i_id)
       );

CREATE TABLE rend_insumo (
       insumo_id INTEGER REFERENCES insumo(id),
       prod_n_id INTEGER REFERENCES prod_n(id),
       n NUMERIC(9,2), -- number of prod_i from 1 insumo
       PRIMARY KEY (insumo_id, prod_n_id)
       );

CREATE TABLE rend_prod_i (
       intermedio INTEGER REFERENCES prod_n(id),
       terminado INTEGER REFERENCES prod_n(id),
       n NUMERIC(9,2), -- number of terminado from 1 intermedio
       PRIMARY KEY (intermedio, terminado),
       CONSTRAINT not_same_prod CHECK (intermedio != terminado)
       );

CREATE TABLE compra (
       id SERIAL UNIQUE,
       insumo_id INTEGER NOT NULL REFERENCES insumo(id),
       n NUMERIC(9,2) NOT NULL,
       price NUMERIC(9,2) NOT NULL,
       fecha DATE NOT NULL DEFAULT CURRENT_DATE
       );

CREATE TABLE gasto (
       id SERIAL,
       des TEXT NOT NULL,
       monto NUMERIC(9,2),
       compra_id INTEGER REFERENCES compra(id)
       );

CREATE TABLE venta (
       id SERIAL,
       prod_t_ids INTEGER[] NOT NULL,
       prod_n_id INTEGER NOT NULL REFERENCES prod_n(id),
       fecha DATE NOT NULL DEFAULT CURRENT_DATE,
       n INTEGER NOT NULL,
       price NUMERIC(9,2) NOT NULL
       );

CREATE TABLE ajuste (
       id SERIAL,
       prod_n_id INTEGER REFERENCES prod_n(id),
       n NUMERIC(9,2) NOT NULL,
       comment TEXT,
       fecha DATE NOT NULL DEFAULT CURRENT_DATE
       );


CREATE FUNCTION add_prod_n(a TEXT)
       RETURNS void AS $$
       INSERT INTO prod_n (t)
       VALUES (UPPER(a));
       $$ LANGUAGE SQL;

CREATE FUNCTION add_insumo(a TEXT, b INTEGER, c NUMERIC(9,2), d NUMERIC(9,2)) 
       RETURNS void AS $$
       INSERT INTO insumo (articulo, unit_id, min_stock, max_stock)
       VALUES (UPPER(a), b ,c ,d);
       $$ LANGUAGE SQL;

CREATE FUNCTION add_prod_i(a INTEGER, b INTEGER) 
       RETURNS void AS $$
       INSERT INTO prod_i (prod_n_id, insumo_id)
       VALUES (a, b);
       $$ LANGUAGE SQL;

CREATE FUNCTION add_prod_t(a INTEGER, b INTEGER) 
       RETURNS void AS $$
       INSERT INTO prod_t (prod_n_id, prod_i_id)
       VALUES (a, b);
       $$ LANGUAGE SQL;

CREATE FUNCTION add_rend_insumo(a INTEGER, b INTEGER, c NUMERIC(9,2))
       RETURNS void AS $$
       INSERT INTO rend_insumo (insumo_id, prod_n_id, n)
       VALUES (a, b, c);
       $$ LANGUAGE SQL;

CREATE FUNCTION add_rend_prod_i(a INTEGER, b INTEGER, c NUMERIC(9,2))
       RETURNS void AS $$
       INSERT INTO rend_prod_i (prod_i_id, prod_t_id, n)
       VALUES (a, b, c);
       $$ LANGUAGE SQL;

