CREATE TABLE `fact_sales` (
  `index` integer PRIMARY KEY,
  `order_id` string,
  `date` date,
  `status` string,
  `product_id` string,
  `fulfillment_id` string,
  `promotion_id` string,
  `qty` integer,
  `amount` float
);

CREATE TABLE `dim_product` (
  `product_id` string PRIMARY KEY,
  `style` string,
  `sku` string,
  `category` string,
  `size` string
);

CREATE TABLE `dim_fulfillment` (
  `fulfillment_id` string PRIMARY KEY,
  `fulfillment` string,
  `fulfilled_by` string
);

CREATE TABLE `dim_promotion` (
  `promotion_id` string PRIMARY KEY,
  `promotion_ids` string
);

CREATE TABLE `fact_salesorder` (
  `index` integer PRIMARY KEY,
  `asin` string,
  `courier_status` string,
  `currency` string,
  `sales_channel_id` string,
  `sales_shipment_id` string,
  `qty` integer,
  `amount` float
);

CREATE TABLE `dim_sales_channel` (
  `sales_channel_id` string PRIMARY KEY,
  `sales_channel` string
);

CREATE TABLE `dim_sales_shipment` (
  `sales_shipment_id` string PRIMARY KEY,
  `ship_service_level` string,
  `ship_city` string,
  `ship_state` string,
  `ship_postal_code` string,
  `ship_country` string
);

ALTER TABLE `dim_product` ADD FOREIGN KEY (`product_id`) REFERENCES `fact_sales` (`product_id`);

ALTER TABLE `dim_fulfillment` ADD FOREIGN KEY (`fulfillment_id`) REFERENCES `fact_sales` (`fulfillment_id`);

ALTER TABLE `dim_promotion` ADD FOREIGN KEY (`promotion_id`) REFERENCES `fact_sales` (`promotion_id`);

ALTER TABLE `dim_sales_channel` ADD FOREIGN KEY (`sales_channel_id`) REFERENCES `fact_salesorder` (`sales_channel_id`);

ALTER TABLE `dim_sales_shipment` ADD FOREIGN KEY (`sales_shipment_id`) REFERENCES `fact_salesorder` (`sales_shipment_id`);
