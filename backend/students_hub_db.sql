CREATE TABLE `institute` (
  `id` INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255),
  `grade` VARCHAR(255)
);

CREATE TABLE `school_address` (
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  `FKid_institute` INTEGER,
  `name` VARCHAR(255),
  PRIMARY KEY (`id`, `FKid_institute`),
  FOREIGN KEY (`FKid_institute`) REFERENCES `institute` (`id`)
);

CREATE TABLE `class` (
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  `FKid_school_address` INTEGER,
  `year` INTEGER,
  PRIMARY KEY (`id`, `FKid_school_address`),
  FOREIGN KEY (`FKid_school_address`) REFERENCES `school_address` (`id`)
);

CREATE TABLE `subject` (
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  `FKid_class` INTEGER,
  `name` VARCHAR(255),
  PRIMARY KEY (`id`, `FKid_class`),
  FOREIGN KEY (`FKid_class`) REFERENCES `class` (`id`)
);

CREATE TABLE `user` (
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  `FKid_institute` INTEGER,
  `FKid_school_address` INTEGER,
  `FKid_class` INTEGER,
  `verificated` TINYINT(1),
  `name` VARCHAR(255),
  `surname` VARCHAR(255),
  `birth_date` DATE,
  `role` VARCHAR(255),
  `class` VARCHAR(255),
  PRIMARY KEY (`id`, `FKid_institute`, `FKid_school_address`, `FKid_class`),
  FOREIGN KEY (`FKid_institute`) REFERENCES `institute` (`id`),
  FOREIGN KEY (`FKid_school_address`) REFERENCES `school_address` (`id`),
  FOREIGN KEY (`FKid_class`) REFERENCES `class` (`id`)
);

CREATE TABLE `account` (
  `FKid_user` INTEGER PRIMARY KEY,
  `email` VARCHAR(255) NOT NULL,
  `username` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `privilege` TINYINT(1) NOT NULL,
  FOREIGN KEY (`FKid_user`) REFERENCES `user` (`id`)
);

CREATE TABLE `contacts` (
  `FKid_user` INTEGER PRIMARY KEY,
  `telephone` VARCHAR(255),
  `instagram` VARCHAR(255),
  `facebook` VARCHAR(255),
  `github` VARCHAR(255),
  FOREIGN KEY (`FKid_user`) REFERENCES `user` (`id`)
);

CREATE TABLE `note` (
  `FKid_user` INTEGER PRIMARY KEY,
  `title` VARCHAR(255),
  `body` VARCHAR(255),
  FOREIGN KEY (`FKid_user`) REFERENCES `user` (`id`)
);

CREATE TABLE `resource` (
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  `FKid_subject` INTEGER,
  `FKid_user` INTEGER,
  `preferred` TINYINT(1),
  `filename` VARCHAR(255),
  `description` VARCHAR(255),
  PRIMARY KEY (`id`, `FKid_subject`, `FKid_user`),
  FOREIGN KEY (`FKid_subject`) REFERENCES `subject` (`id`),
  FOREIGN KEY (`FKid_user`) REFERENCES `user` (`id`)
);

CREATE TABLE `review` (
  `FKid_resource` INTEGER,
  `FKid_user` INTEGER,
  `stars` INTEGER,
  `title` VARCHAR(255),
  `description` VARCHAR(255),
  PRIMARY KEY (`FKid_resource`, `FKid_user`),
  FOREIGN KEY (`FKid_resource`) REFERENCES `resource` (`id`),
  FOREIGN KEY (`FKid_user`) REFERENCES `user` (`id`)
);

CREATE TABLE `class_school_address` (
  `class_FKid_school_address` INTEGER,
  `school_address_id` INTEGER,
  PRIMARY KEY (`class_FKid_school_address`, `school_address_id`),
  FOREIGN KEY (`class_FKid_school_address`) REFERENCES `class` (`id`),
  FOREIGN KEY (`school_address_id`) REFERENCES `school_address` (`id`)
);

CREATE TABLE `subject_class` (
  `subject_FKid_class` INTEGER,
  `class_id` INTEGER,
  PRIMARY KEY (`subject_FKid_class`, `class_id`),
  FOREIGN KEY (`subject_FKid_class`) REFERENCES `subject` (`id`),
  FOREIGN KEY (`class_id`) REFERENCES `class` (`id`)
);