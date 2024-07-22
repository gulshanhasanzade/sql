users
	id,username,email,password,created_at
categories
	id,name,created_at
films
	id,title,description,release_date,category_id,created_at,
comments
	id,film_id,user_id,comment,created_at
wishlist
	id,film_id,user_id,created_at



    CREATE TABLE users( 
     id BIGINT PRIMARY KEY AUTO_INCREMENT,
     username VARCHAR(255) NOT NULL, 
     email VARCHAR(255) UNIQUE NOT NULL, 
     password VARCHAR(255) NOT NULL ,
     created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
     );

INSERT INTO `users`( `username`, `email`, `password`, `created_at`) VALUES ('Gulshan','gulshan@gmail.com','ygfgf','22.07.2024');

      CREATE TABLE categories( 
      id BIGINT PRIMARY KEY AUTO_INCREMENT,
      name VARCHAR(255) NOT NULL, 
      created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );

INSERT INTO `categories`( `name`, `created_at`) VALUES ('action','2024-07-22');



CREATE TABLE films(
id BIGINT PRIMARY KEY AUTO_INCREMENT,
title VARCHAR(255) NOT NULL,
description VARCHAR(255) NOT NULL,
release_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
category_id BIGINT NOT NULL,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY(category_id) REFERENCES categories(id)
);

INSERT INTO `films`( `title`, `description`, `release_date`, `category_id`, `created_at`) VALUES ('avatar','one of the greatest film','2024-07-21',1,'2021-06-23');


CREATE TABLE comments(
id BIGINT PRIMARY KEY AUTO_INCREMENT,
film_id BIGINT NOT NULL,
user_id BIGINT NOT NULL,
comment VARCHAR(500) DEFAULT NULL,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY(film_id) REFERENCES films(id),
FOREIGN KEY(user_id) REFERENCES users(id)
);


INSERT INTO `comments`( `film_id`, `user_id`, `comment`, `created_at`) VALUES (2,1,'great action scenes','2017-05-17');




CREATE TABLE wishlist(
id BIGINT PRIMARY KEY AUTO_INCREMENT,
film_id BIGINT NOT NULL,
user_id BIGINT NOT NULL, 
created_at DATE NOT NULL,
FOREIGN KEY(film_id) REFERENCES films(id),
FOREIGN KEY(user_id) REFERENCES users(id)
);

INSERT INTO `wishlist`( `film_id`, `user_id` ) VALUES (2,1);