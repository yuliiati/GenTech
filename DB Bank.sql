CREATE TABLE `clients` (
  `client_id` int(primary key),
  `first_name` varchar(255),
  `last_name` varchar(255),
  `email` varchar(255),
  `phone` varchar(255),
  `address` varchar(255)
);

CREATE TABLE `bills` (
  `account_id` int(primary key),
  `client_id` int(foreign key),
  `account_number` varchar(255),
  `balance` decimal,
  `opened_date` date,
  `is_active` boolean
);

CREATE TABLE `transactions` (
  `transaction_id` int(primary key),
  `account_id` int(foreign key),
  `transaction_type` varchar(255),
  `amount` decimal,
  `transaction_date` datetime
);

CREATE TABLE `loans` (
  `loan_id` int(primary key),
  `client_id` int(foreign key),
  `loan_amount` decimal,
  `interest_rate` decimal,
  `start_date` date,
  `end_date` date,
  `is_closed` boolean
);

CREATE TABLE `deposites` (
  `deposit_id` int(primary key),
  `client_id` int(foreign key),
  `deposit_amount` decimal,
  `interest_rate` decimal,
  `start_date` date,
  `end_date` date,
  `is_closed` boolean
);

ALTER TABLE `transactions` ADD FOREIGN KEY (`transaction_id`) REFERENCES `clients` (`client_id`);

ALTER TABLE `bills` ADD FOREIGN KEY (`account_id`) REFERENCES `transactions` (`account_id`);

ALTER TABLE `loans` ADD FOREIGN KEY (`loan_id`) REFERENCES `clients` (`client_id`);

ALTER TABLE `deposites` ADD FOREIGN KEY (`deposit_id`) REFERENCES `clients` (`client_id`);
