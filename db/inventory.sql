DROP TABLE IF EXISTS inventory_items;
DROP TABLE IF EXISTS manufacturers;

CREATE TABLE manufacturers(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  address VARCHAR(255) NOT NULL,
  city VARCHAR(255) NOT NULL,
  post_code VARCHAR(255) NOT NULL,
  phone VARCHAR(255) NOT NULL,
  notes TEXT
);

CREATE TABLE inventory_items(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  manufacturer_id INT8 REFERENCES manufacturers(id) ON DELETE CASCADE,
  cost_price DECIMAL NOT NULL,
  sell_price DECIMAL NOT NULL,
  quantity INT2 NOT NULL,
  wrn_lvl INT2 NOT NULL,
  crit_lvl INT2 NOT NULL,
  notes TEXT
);
