
PRAGMA foreign_keys = ON;


DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS locations;

CREATE TABLE locations (
    location_id INTEGER PRIMARY KEY,
    name TEXT,
    city TEXT,
    state TEXT
);

CREATE TABLE customers (
    customer_id INTEGER PRIMARY KEY,
    name TEXT,
    faction TEXT,
    city TEXT,
    state TEXT
);

CREATE TABLE products (
    product_id INTEGER PRIMARY KEY,
    name TEXT,
    category TEXT,
    base_price REAL,
    danger_level INTEGER
);

CREATE TABLE orders (
    order_id INTEGER PRIMARY KEY,
    customer_id INTEGER,
    location_id INTEGER,
    order_date TEXT,
    total_estimated REAL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (location_id) REFERENCES locations(location_id)
);

CREATE TABLE order_items (
    item_id INTEGER PRIMARY KEY,
    order_id INTEGER,
    product_id INTEGER,
    quantity INTEGER,
    price REAL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO locations (name, city, state) VALUES
('BOS Hub Alpha', 'Boston', 'MA'),
('Commonwealth Outpost 1', 'Cambridge', 'MA'),
('Glowing Sea Depot', 'Natick', 'MA'),
('Quincy Trade Post', 'Quincy', 'MA'),
('Providence Cache', 'Providence', 'RI'),
('Fall River Exchange', 'Fall River', 'MA'),
('NYC Ruins Market', 'New York', 'NY'),
('Brooklyn Armory', 'Brooklyn', 'NY'),
('Manhattan Blacksite', 'Manhattan', 'NY'),
('Albany Relay Station', 'Albany', 'NY'),
('Philadelphia Vault Gate', 'Philadelphia', 'PA'),
('Pittsburgh Forge', 'Pittsburgh', 'PA'),
('Atlantic City Strip Market', 'Atlantic City', 'NJ'),
('Newark Supply Node', 'Newark', 'NJ'),
('Baltimore Harbor Hub', 'Baltimore', 'MD'),
('DC Wasteland Center', 'Washington', 'DC'),
('Richmond Relay', 'Richmond', 'VA'),
('Norfolk Dock Exchange', 'Norfolk', 'VA'),
('Charlotte Fringe Market', 'Charlotte', 'NC'),
('Raleigh Supply Point', 'Raleigh', 'NC'),
('Charleston Coastal Depot', 'Charleston', 'SC'),
('Savannah Trade Lock', 'Savannah', 'GA');

-- =========================
-- CUSTOMERS (5000)
-- =========================

WITH RECURSIVE nums(n) AS (
    SELECT 1
    UNION ALL
    SELECT n + 1 FROM nums WHERE n < 5000
)
INSERT INTO customers (name, faction, city, state)
SELECT
    'Client_' || n,
    CASE (ABS(RANDOM()) % 5)
        WHEN 0 THEN 'Brotherhood of Steel'
        WHEN 1 THEN 'Raiders'
        WHEN 2 THEN 'Vault Dwellers'
        WHEN 3 THEN 'NCR Remnants'
        ELSE 'Caesar Legion Cells'
    END,
    CASE (ABS(RANDOM()) % 5)
        WHEN 0 THEN 'Boston'
        WHEN 1 THEN 'New York'
        WHEN 2 THEN 'Philadelphia'
        WHEN 3 THEN 'Baltimore'
        ELSE 'Washington'
    END,
    CASE (ABS(RANDOM()) % 5)
        WHEN 0 THEN 'MA'
        WHEN 1 THEN 'NY'
        WHEN 2 THEN 'PA'
        WHEN 3 THEN 'MD'
        ELSE 'DC'
    END
FROM nums;

-- =========================
-- PRODUCTS (120 ITEMS)
-- =========================

WITH RECURSIVE nums(n) AS (
    SELECT 1
    UNION ALL
    SELECT n + 1 FROM nums WHERE n < 120
)
INSERT INTO products (name, category, base_price, danger_level)
SELECT
    CASE
        WHEN n % 6 = 0 THEN 'Laser Rifle Mk ' || n
        WHEN n % 6 = 1 THEN 'Pipe Weapon Kit ' || n
        WHEN n % 6 = 2 THEN 'Combat Armor Set ' || n
        WHEN n % 6 = 3 THEN 'Stimpak Pack ' || n
        WHEN n % 6 = 4 THEN 'Rad-X Supply ' || n
        ELSE 'Explosive Charge ' || n
    END,
    CASE
        WHEN n % 6 = 0 THEN 'Energy Weapons'
        WHEN n % 6 = 1 THEN 'Improvised Weapons'
        WHEN n % 6 = 2 THEN 'Armor'
        WHEN n % 6 = 3 THEN 'Medical'
        WHEN n % 6 = 4 THEN 'Chemicals'
        ELSE 'Explosives'
    END,
    (ABS(RANDOM() % 500) + 50) / 1.0,
    (ABS(RANDOM() % 100) + 1)
FROM nums;

-- =========================
-- ORDERS (80,000 over 5 years)
-- =========================

WITH RECURSIVE nums(n) AS (
    SELECT 1
    UNION ALL
    SELECT n + 1 FROM nums WHERE n < 80000
)
INSERT INTO orders (customer_id, location_id, order_date, total_estimated)
SELECT
    (ABS(RANDOM() % 5000) + 1),
    (ABS(RANDOM() % 22) + 1),
    datetime('now', '-' || (ABS(RANDOM() % 1825)) || ' days'),
    (ABS(RANDOM() % 5000) / 1.0)
FROM nums;

-- =========================
-- ORDER ITEMS (1 PER ORDER = 80K ROWS)
-- =========================

WITH RECURSIVE nums(n) AS (
    SELECT 1
    UNION ALL
    SELECT n + 1 FROM nums WHERE n < 80000
)
INSERT INTO order_items (order_id, product_id, quantity, price)
SELECT
    n,
    (ABS(RANDOM() % 120) + 1),
    (ABS(RANDOM() % 5) + 1),
    (ABS(RANDOM() % 500) + 50) / 1.0
FROM nums;
