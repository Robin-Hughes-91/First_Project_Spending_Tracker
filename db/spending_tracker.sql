DROP TABLE tags;
DROP TABLE merchants;
DROP TABLE transactions;

CREATE TABLE tags
(
  id SERIAL8 primary key,
  tag_name VARCHAR(255),
  tag_logo VARCHAR(255)
);

CREATE TABLE merchants
(
  id SERIAL8 primary key,
  merchant_name VARCHAR(255),
  merchant_logo VARCHAR(255)
);

CREATE TABLE transactions
(
  id SERIAL8 primary key,
  tags_id INT8 references tags(id),
  merchants_id INT8 references merchants(id),
  transaction_value INT8
);
